#ifndef _STATE_MACHINE_H_
#define _STATE_MACHINE_H_

#include <ros/ros.h>
#include "../include/Period.h"

#define PUBLIC_SECONDS 5
#define SOCIAL_PUBLIC_SECONDS 5
#define SOCIAL_SECONDS 10
#define PERSONAL_SOCIAL_SECONDS 5

class StateMachine {
public:		
	StateMachine();

	enum class ProxemicArea {
		Public = 0u,
		SocialPublic = 1u,
		Social = 2u,
		PersonalSocial = 3u,
		Personal = 4u
	};

	void setDistance(double distance);
	double getDesiredDistance();
	
	void setOnChangeCallback(void (*onChange) (ProxemicArea last, ProxemicArea current));

private:
	ProxemicArea m_proxemic_area_current;
	ProxemicArea m_proxemic_area_last;
	ProxemicArea m_proxemic_area_desired;
	double m_distance;
	
    Period t_social_public;
	Period t_public;
	Period t_social;
	Period t_personal_social;

	void (*m_onChange) (ProxemicArea last, ProxemicArea current) {nullptr};

	ProxemicArea getProxemicArea();
	void executeStateMachine();
};

#endif