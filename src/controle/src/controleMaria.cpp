/*
 * Arquivo principal
 * 
 * Contém o controlador proposto
 * 
 */

#include <ros/ros.h>
#include <sensor_msgs/LaserScan.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include "Proxemica.h"
#include "Funcoes.h"
#include "Kid.h"
#include "AreaTrabalho.h"
#include "PleasureArousalDominance.h"
#include "Tempo.h"
#include "Plutchik4D.h"
#include "Log.h"
#include <unistd.h>
#include "Funcoes.h"

#include <controle/Data.h>
#include <controle/Emotion.h>
#include <controle/Plutchik.h>

#include <controle/ChangeMode.h>
#include <operation_modes/OperationModes.h>

const double DISTANCIA_DE_SEGURANCA = 0.4; // metros
const double KV = 0.5;
const double KD = 40.0;
const double KW = 1.0;
const float MEDO_BORDA = 0.0f; // 10.0f; Modificado para 0, para inibir

#define SECOND 1000000 // 1.000.000 microsegundos

ros::Publisher pub; // Para fazer a publicação dos comandos de velocidade.
ros::Publisher pub_supervisorio;
ros::Publisher pub_emotion;
ros::Publisher pub_plutchik;

ros::ServiceServer service_change_mode;

nav_msgs::Odometry pose_robo;
AreaTrabalho area_trabalho;
Kid kid;
Proxemica proxemica;
PleasureArousalDominance pad;
Tempo tempoPAD;

operation_modes::OperationModes modo_operacao;

double distancia_anterior{0.0};
double delta_distancia{0.0};

// Function to change mode of MARIA
//
// This function can be called using a service "change_mode" by ROS nodes
//
bool changeMode(controle::ChangeMode::Request &req,
				controle::ChangeMode::Response &res) {

	bool success{true};					

	switch (req.mode)
	{
	case operation_modes::OperationModes::OPERATION_MODE_STOP:	
		ROS_INFO("changeMode 0: Stop.");
		break;

	case operation_modes::OperationModes::OPERATION_MODE_FOLLOW:
		ROS_INFO("changeMode 5: Follow.");
		break;

	case operation_modes::OperationModes::OPERATION_MODE_PRESENT:
		ROS_INFO("changeMode 1: Present. TO DO");
		break;
	
	default:
		ROS_ERROR("changeMode %d not implemented.", req.mode);
		success = false;
		break;
	}

	if (success) {
		modo_operacao.code = req.mode;
	}

	res.status = success;
	return success;
}

void publicaEmocao(
		PleasureArousalDominance& pad) {
	
	controle::Emotion emotion;
	controle::Plutchik plutchik;
	Plutchik4D plutchik4d;

	emotion.header.frame_id = "maria_emotion";
	emotion.header.stamp = ros::Time::now();

	emotion.code = (unsigned int) pad.getEmotion();
	
	emotion.percentage = pad.getIntensity();	

	emotion.pleasure = pad.pleasure.getValue();
	emotion.arousal = pad.arousal.getValue();
	emotion.dominance = pad.dominance.getValue();

	pub_emotion.publish(emotion);

	///////////////////////////////////////
	// Plutchik representation of Emotion

	plutchik4d.setValuesFromPAD(pad);
	plutchik.header.frame_id = "maria_plutchik4d";
	plutchik.header.stamp = ros::Time::now();
	plutchik.anger_fear = plutchik4d.anger_fear.getValue();
	plutchik.joy_sadness = plutchik4d.joy_sadness.getValue();
	plutchik.surprise_anticipation = plutchik4d.surprise_anticipation.getValue();
	plutchik.trust_disgust = plutchik4d.trust_disgust.getValue();
	pub_plutchik.publish(plutchik);
}

// publicaVelocidades
//
// @param velocidade_linear: velocidade linear [m/s]
// @param velocidade_angular: velocidade angular [rad/s]
//
void publicaVelocidades(
		const double& velocidade_linear, 
		const double& velocidade_angular)
{
	geometry_msgs::Twist vel;

	vel.linear.x = velocidade_linear;
	vel.angular.z = velocidade_angular;

	pub.publish(vel);
}

void publicaDistancias(
		double distancia, 
		double distancia_desejada, 
		double distancia_observacao, 
		Proxemica::AreaProxemica area_proxemica,
		double angulo)
{
	controle::Data data;

	data.header.stamp = ros::Time::now();
	data.header.frame_id = "maria";

	data.distance.desired = distancia_desejada;
	data.distance.current = distancia;
	data.distance.observation = distancia_observacao;
	
	data.proxemic_zone = (unsigned int) area_proxemica;
	data.workspace_area = (unsigned int) area_trabalho.getArea();

	data.angle = angulo;

	pub_supervisorio.publish(data);
}

// Para a movimentação do robô
void parar() {
	publicaVelocidades(0.0, 0.0);
}

// seguir
//
// @param distancia	Distancia em metros [m]
// @param angulo	Angulo em graus [°]
//
void seguir(
		double distancia,
		double angulo) {
	
	double velocidade_linear, velocidade_angular, distancia_interacao, distancia_sem_correcao;
	char msg[100];
	double fator_afastamento;
	double distancia_observacao;

	// Atualiza a posição da criança
	kid.setPose(pose_robo, distancia, angulo);

	// Obtém a distância desejada, conforme o grau de proximidade 
	proxemica.setDistancia(distancia);
	distancia_interacao = proxemica.getDistanciaDesejada();

	distancia_sem_correcao = distancia;
	
	// Se estiver dentro da área de observação, despreza a distância de observação
	area_trabalho.setKid(kid);
	distancia_observacao = area_trabalho.obtemDistanciaObservacao();
	distancia -= distancia_observacao;
	
	// Calcula a distância que será usada no controlador
	distancia -= distancia_interacao;

	// cálculo da variação de distâncias entre o robô e a criança
	delta_distancia = distancia - distancia_anterior;
	distancia_anterior = distancia;

	if (delta_distancia > 0.0) {
		fator_afastamento = 2.0 / (1.0 + exp(100.0 * delta_distancia));
	}
	else {
		fator_afastamento = 1.0;
	}

	
	// -------------------------------------------
	// Cálculo das velocidades linear e angular
	// -------------------------------------------
	angulo = deg2rad(angulo);

	velocidade_linear = 0.0;
	if (area_trabalho.getArea() != AreaTrabalho::Area::Externa) {
		velocidade_linear = KV * distancia * cos(angulo) * fator_afastamento;
	}			

	velocidade_angular = 0.0;
	if (distancia != 0.0) {
		velocidade_angular = KW * tanh(angulo) + velocidade_linear * sin(angulo) / distancia;
	}

	//publicaDistancias(distancia_sem_correcao, distancia_interacao, distancia_observacao, proxemica.getAreaProxemica(), angulo);	
	publicaVelocidades(velocidade_linear, velocidade_angular);

	// se houver tempoPAD, faz o ajuste
	if (tempoPAD.estaLigado()) {
		pad.moveToZero(0.0001f);
	}


} // void seguir( ...

void poseCallback(const nav_msgs::Odometry::ConstPtr& msg) {
    float prox{0.0f};
	
	pose_robo = *msg;
	area_trabalho.setRobo(pose_robo);

	// ajusta Domínio (Dominance) se o robô se aproximar da parede
	prox = area_trabalho.obtemProximidadeComBorda();
	if (prox > 0.0f) {
		pad.dominance.decrease(prox * MEDO_BORDA);	
	}
}

void scanCallback(const sensor_msgs::LaserScan::ConstPtr& scan) {
	int L = scan->ranges.size();
	int index{-1};
	double value{std::numeric_limits<float>::infinity()};

	// todos os valores inválidos são iguais a "infinito"
	for (unsigned int i = 0u; i < L; i++) {
		if (scan->ranges[i] < value) {
			value = scan->ranges[i];
			index = i;
		}
	}
			
	// Verifica se encontrou algum obstáculo na área
	if (index > -1) {
		float degree = rad2deg(scan->angle_min + scan->angle_increment * index);
		index = (int) round(degree);

		// o index representa o angulo na faixa de 0 .. 359
		// há necessidade de converter para o padrão -180..180
		index = ajustaAngulo(index);

		// Verifica qual ação a ser realizada
		switch (modo_operacao.code)
		{
		case operation_modes::OperationModes::OPERATION_MODE_FOLLOW:
			seguir(value, index);
			break;

		case operation_modes::OperationModes::OPERATION_MODE_STOP:
			parar();
			break;
		
		default:
			parar();
			break;
		}		
	}
	// Não encontrou obstáculo na área
	else {
		parar();
	}
}
 
void onChangePAD(float const p, float const a, float const d)
{
//	ROS_INFO_STREAM("onChangePAD(" << p << " , " << a << " , " << d << ")\n");
	publicaEmocao(pad);

	if (! tempoPAD.estaLigado()) {
		tempoPAD.ligar();
	}

	if (pad.isZero()) {
		tempoPAD.desligar();
	}
}

void onChangeProxemica(Proxemica::AreaProxemica antiga, Proxemica::AreaProxemica atual) {
	//ROS_INFO_STREAM("onChangeProxemica(" << int(antiga) << "," << int(atual) << ")\n");

	if (atual == Proxemica::AreaProxemica::Publica)	{
		if (antiga == Proxemica::AreaProxemica::SocialPublica) {
			pad.setMinValue();
		}
	}

	if (atual == Proxemica::AreaProxemica::Social) {
		if (antiga == Proxemica::AreaProxemica::SocialPublica) {
			pad.setValue(
				Dimension::MAX_VALUE/2.0, 
				Dimension::MAX_VALUE/2.0, 
				Dimension::MAX_VALUE/2.0);
		}
		
		if (antiga == Proxemica::AreaProxemica::PessoalSocial) {
			pad.setValue(
				-Dimension::MAX_VALUE/2.0, 
				-Dimension::MAX_VALUE/2.0, 
				-Dimension::MAX_VALUE/2.0);
		}
	}

	if (atual == Proxemica::AreaProxemica::Pessoal) {
		if (antiga == Proxemica::AreaProxemica::PessoalSocial) {
			pad.setMaxValue();;
		}
	}
}

int main (int argc, char** argv) {
	ros::init(argc, argv, "controleMaria");	
	ros::NodeHandle n;
	
	//ros::Subscriber sub = n.subscribe("RosAria/sim_lms2xx_1_laserscan", 1000, &scanCallback);
	ros::Subscriber sub = n.subscribe("testekid/laserscan", 1000, &scanCallback);
	ros::Subscriber sub_pose = n.subscribe("RosAria/pose", 1000, &poseCallback);	

	pub = n.advertise<geometry_msgs::Twist>("RosAria/cmd_vel", 1000);
	pub_supervisorio = n.advertise<controle::Data>("maria/supervisorio", 1000);
	pub_emotion = n.advertise<controle::Emotion>("maria/emotion", 1000);
	pub_plutchik = n.advertise<controle::Plutchik>("maria/plutchick", 1000);

	service_change_mode = n.advertiseService("change_mode", changeMode);

	tempoPAD = Tempo();
	
	proxemica.setOnChangeCallback(&onChangeProxemica);
	pad.setOnChangeCallback(&onChangePAD);

	if (
			sub 
			&& sub_pose 
			&& pub 
			&& pub_supervisorio
			&& pub_emotion
			&& pub_plutchik) {
		ROS_INFO("controleMaria: Subscriber and publisher, done!");
		ros::spin();

		ROS_INFO("End of controleMaria.");
	}
	else {
		ROS_INFO_STREAM("Error on subscriber or publisher!\n");
	}
	
	return 0;
}
