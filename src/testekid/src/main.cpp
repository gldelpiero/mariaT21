// cria uma simulação de posicionamento da criança
// utiliza a posição do robô (que é publicada no ROS via geometry_msgs/Point)
// e cria um pseudo radar que publica a distância entre a criança e robô (com o ângulo entre eles)

#include <ros/ros.h>
#include <sensor_msgs/LaserScan.h>
#include <nav_msgs/Odometry.h>
#include <cmath>
#include <string>
#include <iostream>
#include <general_functions.h>
#include <testekid/Position.h>
#include <fstream>

enum class Direcao {
    Cima,
    Baixo,
    Esquerda,
    Direita
};

typedef struct point_ {
	double x;
	double y;
    Direcao direcao;
    unsigned int count;
} Point;

ros::Publisher pub;
ros::Publisher pub_position;
nav_msgs::Odometry pose_robo;
nav_msgs::Odometry poseCrianca;

double quaternions2angle(double z, double w) {
    double s = 2 * (z * w);
    double c = 1 - 2 * z * z;

    return GeneralFunctions::radToDeg(atan2(s, c));
}

// void poseCallback(const geometry_msgs::Pose::ConstPtr& pose) {
void poseCallback(const nav_msgs::Odometry::ConstPtr& msg) {
    pose_robo = *msg;
}

int ajustaAngulo(double angulo) {
    int a = (int) round(angulo);
    
    if (a < 0) {
        a = abs(a);
    } 
    else {
        if (a > 0) {
            a = 360 - a;
        }
    }
    
    return a;
}

void publicaPosicao() {
    testekid::Position msg;

    msg.header.stamp = ros::Time::now();
    msg.header.frame_id = "testekid_position";
    msg.x = poseCrianca.pose.pose.position.x;
    msg.y = poseCrianca.pose.pose.position.y;

    pub_position.publish(msg);
}

void publicaLaserscan(double distancia, int angulo) {
    unsigned int numberReadings = 360;
    double laserFrequency = 8000;
    double ranges[numberReadings];

    for (unsigned int i = 0; i < numberReadings; i++) {
        ranges[i] = std::numeric_limits<float>::infinity();
    }

    ranges[angulo] = distancia;

    ros::Time scanTime = ros::Time::now();

    sensor_msgs::LaserScan scan;
    scan.header.stamp = scanTime;
    scan.header.frame_id = "laser_frame";
    scan.angle_min = GeneralFunctions::degToRad(0.0);
    scan.angle_max = GeneralFunctions::degToRad(359.0);
    scan.angle_increment = GeneralFunctions::degToRad(1.0);
    scan.time_increment = 1 / (double)(numberReadings-1);
    scan.range_min = 0.15;
    scan.range_max = 8;
    scan.ranges.resize(numberReadings);

    for (unsigned int i=0; i<numberReadings; i++) {
        scan.ranges[i] = ranges[i];
    }

    pub.publish(scan);
}

void simulaLaser(double* distancia, int* angulo) {
    double deltaX = poseCrianca.pose.pose.position.x - pose_robo.pose.pose.position.x;
    double deltaY = poseCrianca.pose.pose.position.y - pose_robo.pose.pose.position.y;

    double anguloRobo = quaternions2angle(pose_robo.pose.pose.orientation.z, pose_robo.pose.pose.orientation.w);
    double anguloCrianca = GeneralFunctions::radToDeg(atan2(deltaY, deltaX));
    
    *distancia = sqrt(deltaX * deltaX + deltaY * deltaY);
    *angulo = ajustaAngulo(anguloCrianca - anguloRobo);
}

double eDist(const double x1, const double y1, const double x2, const double y2) {
    return sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
}

int main (int argc, char** argv) {
    ros::init(argc, argv, "testekid");	
	ros::NodeHandle n;
	ros::Subscriber sub = n.subscribe("RosAria/pose", 1000, &poseCallback);

    double distancia;
    int angulo;
    unsigned int count = 0;
    int tempo;

    double x;
    double y;
    char cd;
    Direcao d;
    unsigned int t;

    double dx;
    double dy;
    double theta;

    unsigned int pose_index = 0;
    unsigned int pose_next = 1;
    std::vector<Point> poses;

    double acr = 0.05; // metros a cada ciclo de 10 Hz = 0.5 m/s

    if (argc > 1) {
        ROS_INFO_STREAM("loading path from" << argv[1]);
        // load from file
        std::ifstream inFile;
        inFile.open(argv[1]);
        if (inFile.is_open()) {
            while (inFile >> x >> y >> cd >> t) {
                switch (cd) {
                case 'L':
                case 'l':                
                    d = Direcao::Esquerda;
                    break;

                case 'R':
                case 'r':
                    d = Direcao::Direita;
                    break;

                case 'U':
                case 'u':
                    d = Direcao::Cima;
                    break;

                case 'D':
                case 'd':
                    d = Direcao:: Baixo;
                    break;
                
                default:
                    break;
                }
                poses.push_back(Point{x, y, d, t});
                ROS_INFO_STREAM(x << "\t" << y << "\t" << cd << "\t" << t);
            }
            inFile.close();
            ROS_INFO_STREAM(poses.size() << " poses was read.");
        }
    }
    else {
        poses.push_back(Point{7.0, 0.0, Direcao::Esquerda, 50});
        poses.push_back(Point{5.5, 0.0, Direcao::Esquerda, 50});
        poses.push_back(Point{4.5, 0.0, Direcao::Cima, 100});
        poses.push_back(Point{4.5, 3.0, Direcao::Esquerda, 100});
        poses.push_back(Point{-5.5, 3.0, Direcao::Esquerda, 100});
        poses.push_back(Point{-7.0, 3.0, Direcao::Baixo, 100});
        poses.push_back(Point{-7.0, -2.0, Direcao::Direita, 100});
        poses.push_back(Point{-3.0, -2.0, Direcao::Direita, 100});
        poses.push_back(Point{7.0, -2.0, Direcao::Cima, 100});
    }

    pub = n.advertise<sensor_msgs::LaserScan>("testekid/laserscan", 1000);
    pub_position = n.advertise<testekid::Position>("testekid/position", 1000);

    if (sub && pub) {
		ROS_INFO("Teste Kid");
        ROS_INFO("\tSubscriber to RosAria/pose");
        ROS_INFO("\tPublisher as testekid/laserscan");
        ROS_INFO("\tPublisher as testekid/position");

        // testa uma círculo de raio 1 m
        if (poses.size() == 0) {
            theta = 0.0;

            ros::Rate rate(10); // 10 Hz
            while (ros::ok()) {

                poseCrianca.pose.pose.position.x = cos(GeneralFunctions::degToRad(theta));
                poseCrianca.pose.pose.position.y = sin(GeneralFunctions::degToRad(theta));

                theta += 0.25;
                if (theta >= 360.0) {
                    theta = 0.0;
                }

                simulaLaser(&distancia, &angulo);
                publicaLaserscan(distancia, angulo);
                publicaPosicao();
                ros::spinOnce(); // wait for and execute callbacks
                rate.sleep();
            }
        }

        // Verifica se o caminho possui apenas um ponto
        else if (poses.size() == 1) {
            poseCrianca.pose.pose.position.x = poses[0].x;
            poseCrianca.pose.pose.position.y = poses[0].y;

            ros::Rate rate(10); // 10 Hz
            while (ros::ok()) {
                simulaLaser(&distancia, &angulo);
                publicaLaserscan(distancia, angulo);
                publicaPosicao();
                ros::spinOnce(); // wait for and execute callbacks
                rate.sleep();
            }
        }

        // O caminho possui mais de um ponto
        else {
            // A criança inicia a simulação fora da área de Interação
            // A posição é dada em metros.
            poseCrianca.pose.pose.position.x = poses[pose_index].x;
            poseCrianca.pose.pose.position.y = poses[pose_index].y;

            ros::Rate rate(10); // 10 Hz
            tempo = poses[pose_index].count;

            while (ros::ok()) {
                if (tempo > 0) {
                    tempo--;
                }
                else {
                    //dx = poses[pose_next].x - poses[pose_index].x;
                    //dy = poses[pose_next].y - poses[pose_index].y;
                    //theta = atan2(dy, dx);

                    switch (poses[pose_index].direcao) {
                        case Direcao::Baixo:
                            poseCrianca.pose.pose.position.y -= acr;
                            break;

                        case Direcao::Cima:
                            poseCrianca.pose.pose.position.y += acr;
                            break;

                        case Direcao::Esquerda:
                            poseCrianca.pose.pose.position.x -= acr;
                            break;

                        case Direcao::Direita:
                            poseCrianca.pose.pose.position.x += acr;
                            break;
                    }
                    //poseCrianca.pose.pose.position.x += acr * cos(theta);
                    //poseCrianca.pose.pose.position.y += acr * sin(theta);

                    if (eDist(poseCrianca.pose.pose.position.x, poseCrianca.pose.pose.position.y,
                        poses[pose_next].x, poses[pose_next].y) < 0.01) {
                        pose_index = pose_next;
                        tempo = poses[pose_index].count;
                        pose_next++;
                        if (pose_next >= poses.size()) {
                            pose_next = 0;
                        }
                    }
                }

                simulaLaser(&distancia, &angulo);
                publicaLaserscan(distancia, angulo);
                publicaPosicao();
                ros::spinOnce(); // wait for and execute callbacks
                rate.sleep();
            } // while (ros::ok())
        } // O caminho possui mais de um ponto
	}
	else {
		ROS_INFO_STREAM("Error on subscriber or publisher!\n");
	}
	
	return 0;
}