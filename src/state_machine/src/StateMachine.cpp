#include "../include/StateMachine.h"

StateMachine::StateMachine() {
    m_proxemic_area_last = ProxemicArea::Public;
    m_proxemic_area_current = ProxemicArea::Public;
    m_proxemic_area_desired = ProxemicArea::SocialPublic; 

	t_personal_social.setName("Personal Social");
	t_public.setName("Public");
	t_social.setName("Social");
	t_social_public.setName("Social public");
}

void StateMachine::setDistance(double distance) {
    m_distance = distance;
	m_proxemic_area_current = getProxemicArea();
	executeStateMachine();
}

double StateMachine::getDesiredDistance() {
    switch (m_proxemic_area_desired) {
		case ProxemicArea::Personal:
			return 0.5;

		case ProxemicArea::PersonalSocial:
			return 1.5;

		case ProxemicArea::Social:
			return 2;

		case ProxemicArea::SocialPublic:
			return 3.5;

		case ProxemicArea::Public:
			return 4;
	}
	return 0;    
}

void StateMachine::setOnChangeCallback(void (*onChange) (ProxemicArea last, ProxemicArea current)) {
    m_onChange = onChange;
}

StateMachine::ProxemicArea StateMachine::getProxemicArea() {
    if (m_distance > 4)
		return ProxemicArea::Public;
	
	if (m_distance > 3.5)
		return ProxemicArea::SocialPublic;

	if (m_distance > 2)
		return ProxemicArea::Social;

	if (m_distance > 1.5)
		return ProxemicArea::PersonalSocial;

	return ProxemicArea::Personal;
}

void StateMachine::executeStateMachine() {
	ROS_INFO_STREAM("[execute] current: " << int(m_proxemic_area_current));
	ROS_INFO_STREAM("          last:" << int(m_proxemic_area_last));
	ROS_INFO_STREAM("          desired:" << int(m_proxemic_area_desired));

    if (m_proxemic_area_current != m_proxemic_area_last) {
		if (m_onChange != nullptr)
		{
			m_onChange(m_proxemic_area_last, m_proxemic_area_current);
		}

		switch (m_proxemic_area_current) {
		case ProxemicArea::Public:			
			t_public.turnOn();
			t_social_public.turnOff();
			m_proxemic_area_desired = ProxemicArea::SocialPublic;
			break;

		case ProxemicArea::SocialPublic:
			t_social_public.turnOn();
			t_public.turnOff();
			t_social.turnOff();

			//if (m_proxemic_area_last == ProxemicArea::Public) {
			//	m_proxemic_area_desired = ProxemicArea::Social;
			//}

			break;

		case ProxemicArea::Social:
			t_social.turnOn();
			t_personal_social.turnOff();
			t_social_public.turnOff();

			//if (m_proxemic_area_last == ProxemicArea::SocialPublic) {
			//	m_proxemic_area_desired = ProxemicArea::PersonalSocial;
			//}

			break;

		case ProxemicArea::PersonalSocial:
			t_personal_social.turnOn();
			t_social.turnOff();

			//if (m_proxemic_area_last == ProxemicArea::Social) {
			//	m_proxemic_area_desired = ProxemicArea::Personal;
			//}

			break;

		case ProxemicArea::Personal:			
			t_personal_social.turnOff();
			break;
		}
	}
	else {
		switch (m_proxemic_area_current) {
			case ProxemicArea::Public:
				m_proxemic_area_desired = ProxemicArea::SocialPublic;
				break;

			case ProxemicArea::SocialPublic:
				if (m_proxemic_area_desired != ProxemicArea::Social) {
					if (t_social_public.isOn()) {
						if (t_social_public.getSeconds() >= SOCIAL_PUBLIC_SECONDS) {
							m_proxemic_area_desired = ProxemicArea::Social;
							t_social_public.turnOff();
						}
					}
					else {
						t_social_public.turnOn();
					}
				}
				break;

			case ProxemicArea::Social:
				if (m_proxemic_area_desired != ProxemicArea::PersonalSocial) {
					if (t_social.isOn()) {
						if (t_social.getSeconds() >= SOCIAL_SECONDS) {
							m_proxemic_area_desired = ProxemicArea::PersonalSocial;
							t_social.turnOff();
						}
					}
					else {
						t_social.turnOn();
					}
				}
				break;

			case ProxemicArea::PersonalSocial:
				if (m_proxemic_area_desired != ProxemicArea::Personal) {
					if (t_personal_social.isOn()) {
						if (t_personal_social.getSeconds() >= PERSONAL_SOCIAL_SECONDS) {
							m_proxemic_area_desired = ProxemicArea::Personal;
							t_personal_social.turnOff();
						}
					}
					else {
						t_personal_social.turnOn();
					}
				}
				break;

			case ProxemicArea::Personal:
				if (t_personal_social.isOn())
					t_personal_social.turnOff();
				break;
		}
	}

	m_proxemic_area_last = m_proxemic_area_current;
}