#include "Proxemica.h"

Proxemica::Proxemica() {
	m_area_proxemica_desejada = AreaProxemica::SocialPublica;
	m_area_proxemica_anterior = AreaProxemica::Publica;
	m_area_proxemica_atual = AreaProxemica::Publica;
}

double Proxemica::getDistanciaDesejada() {
	switch (m_area_proxemica_desejada) {
		case AreaProxemica::Pessoal:
			return 0.5;

		case AreaProxemica::PessoalSocial:
			return 1.5;

		case AreaProxemica::Social:
			return 2;

		case AreaProxemica::SocialPublica:
			return 3.5;

		case AreaProxemica::Publica:
			return 4;
	}
	return 0;
}

void Proxemica::setDistancia(double distancia) {
	distancia_ = distancia;
	m_area_proxemica_atual = getAreaProxemica();
	trataProxemica();
}

Proxemica::AreaProxemica Proxemica::getAreaProxemica() {
	if (distancia_ > 4)
		return AreaProxemica::Publica;
	
	if (distancia_ > 3.5)
		return AreaProxemica::SocialPublica;

	if (distancia_ > 2)
		return AreaProxemica::Social;

	if (distancia_ > 1.5)
		return AreaProxemica::PessoalSocial;

	return AreaProxemica::Pessoal;
}

/*void Proxemica::showROS() {
    switch (m_area_proxemica_atual) {
    case AreaProxemica::Publica:
        ROS_INFO_STREAM("Area proxemica atual: Publica\n");
        break;

    case AreaProxemica::SocialPublica:
        ROS_INFO_STREAM("Area proxemica atual: Social Publica\n");
        break;

    case AreaProxemica::Social:
        ROS_INFO_STREAM("Area proxemica atual: Social\n");
        break;

    case AreaProxemica::PessoalSocial:
        ROS_INFO_STREAM("Area proxemica atual: Pessoal Social\n");
        break;

    case AreaProxemica::Pessoal:
        ROS_INFO_STREAM("Area proxemica atual: Pessoal\n");
        break;
    }

	switch (m_area_proxemica_desejada) {
    case AreaProxemica::Publica:
        ROS_INFO_STREAM("Area proxemica desejada: Publica\n");
        break;

    case AreaProxemica::SocialPublica:
        ROS_INFO_STREAM("Area proxemica desejada: Social Publica\n");
        break;

    case AreaProxemica::Social:
        ROS_INFO_STREAM("Area proxemica desejada: Social\n");
        break;

    case AreaProxemica::PessoalSocial:
        ROS_INFO_STREAM("Area proxemica desejada: Pessoal Social\n");
        break;

    case AreaProxemica::Pessoal:
        ROS_INFO_STREAM("Area proxemica desejada: Pessoal\n");
        break;
    }	
}*/

void Proxemica::trataProxemica() {
	if (m_area_proxemica_atual != m_area_proxemica_anterior) {
		if (m_onChange != nullptr)
		{
			m_onChange(m_area_proxemica_anterior, m_area_proxemica_atual);
		}

		switch (m_area_proxemica_atual) {
		case AreaProxemica::Publica:			
			tempo_publico.ligar();
			tempo_social_publico.desligar();
			m_area_proxemica_desejada = AreaProxemica::SocialPublica;
			break;

		case AreaProxemica::SocialPublica:
			tempo_social_publico.ligar();
			tempo_publico.desligar();
			tempo_social.desligar();
			break;

		case AreaProxemica::Social:
			tempo_social.ligar();
			tempo_pessoal_social.desligar();
			tempo_social_publico.desligar();
			break;

		case AreaProxemica::PessoalSocial:
			tempo_pessoal_social.ligar();
			tempo_social.desligar();
			break;

		case AreaProxemica::Pessoal:			
			tempo_pessoal_social.desligar();
			break;
		}
	}
	else {
		switch (m_area_proxemica_atual) {
			case AreaProxemica::Publica:
				m_area_proxemica_desejada = AreaProxemica::SocialPublica;
				break;

			case AreaProxemica::SocialPublica:
				if (m_area_proxemica_desejada != AreaProxemica::Social) {
					if (tempo_social_publico.estaLigado()) {
						if (tempo_social_publico.getSegundos() >= SOCIAL_PUBLIC_SECONDS) {
							m_area_proxemica_desejada = AreaProxemica::Social;
							tempo_social_publico.desligar();
						}
					}
					else {
						tempo_social_publico.ligar();
					}
				}
				break;

			case AreaProxemica::Social:
				if (m_area_proxemica_desejada != AreaProxemica::PessoalSocial) {
					if (tempo_social.estaLigado()) {
						if (tempo_social.getSegundos() >= SOCIAL_SECONDS) {
							m_area_proxemica_desejada = AreaProxemica::PessoalSocial;
							tempo_social.desligar();
						}
					}
					else {
						tempo_social.ligar();
					}
				}
				break;

			case AreaProxemica::PessoalSocial:
				if (m_area_proxemica_desejada != AreaProxemica::Pessoal) {
					if (tempo_pessoal_social.estaLigado()) {
						if (tempo_pessoal_social.getSegundos() >= PERSONAL_SOCIAL_SECONDS) {
							m_area_proxemica_desejada = AreaProxemica::Pessoal;
							tempo_pessoal_social.desligar();
						}
					}
					else {
						tempo_pessoal_social.ligar();
					}
				}
				break;

			case AreaProxemica::Pessoal:
				if (tempo_pessoal_social.estaLigado())
					tempo_pessoal_social.desligar();
				break;
		}
	}

	m_area_proxemica_anterior = m_area_proxemica_atual;
}

void Proxemica::setOnChangeCallback(void (*onChange) (AreaProxemica antiga, AreaProxemica atual))
{
	m_onChange = onChange;
}