#ifndef _AREATRABALHO_H_
#define _AREATRABALHO_H_

#include "Funcoes.h"
#include "Kid.h"

const Point VERTICE_AREA_OBSERVACAO = {6.0, 5.0};
const Point VERTICE_AREA_INTERACAO = {5.0, 4.0};
const Point VERTICE_AREA_TRISTEZA = {4.0, 3.0};

class AreaTrabalho {
public:
    enum class Area {
	    Externa = 0u,
	    Observacao = 1u,
	    Interacao = 2u
    };

    void setKid(Kid kid);
    void setRobo(const nav_msgs::Odometry& pose_robo);

    float obtemProximidadeComBorda();    

    Area getArea();
    float obtemDistanciaObservacao();

private:
    nav_msgs::Odometry m_pose_robo;
    Kid m_kid;
    Area m_area;

    void setArea();
};

#endif