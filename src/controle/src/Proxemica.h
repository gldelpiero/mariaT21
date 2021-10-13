#ifndef _PROXEMICA_H_
#define _PROXEMICA_H_

#include "Tempo.h"
#include <ros/ros.h>
//#include <controle/Emotion.h>

#define PUBLIC_SECONDS 5
#define SOCIAL_PUBLIC_SECONDS 5
#define SOCIAL_SECONDS 10
#define PERSONAL_SOCIAL_SECONDS 5

class Proxemica {
public:		
	Proxemica();

	enum class AreaProxemica {
		Publica = 0u,
		SocialPublica = 1u,
		Social = 2u,
		PessoalSocial = 3u,
		Pessoal = 4u
	};

	void setDistancia(double distancia);
	double getDistanciaDesejada();	
	
	void setOnChangeCallback(void (*onChange) (AreaProxemica antiga, AreaProxemica atual));

private:
	AreaProxemica m_area_proxemica_atual;
	AreaProxemica m_area_proxemica_anterior;
	AreaProxemica m_area_proxemica_desejada;
	double distancia_;
	Tempo tempo_social_publico;
	Tempo tempo_publico;
	Tempo tempo_social;
	Tempo tempo_pessoal_social;

	void (*m_onChange) (AreaProxemica antiga, AreaProxemica atual) {nullptr};

	AreaProxemica getAreaProxemica();
	void trataProxemica();
};

#endif