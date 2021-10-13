#include "AreaTrabalho.h"

void AreaTrabalho::setKid(Kid kid)
{
    m_kid.copy(kid);
    setArea();
}

void AreaTrabalho::setRobo(const nav_msgs::Odometry& t_pose_robo)
{
	m_pose_robo = t_pose_robo;
}

AreaTrabalho::Area AreaTrabalho::getArea()
{
    return m_area;
}

void AreaTrabalho::setArea()
{
	if ((abs(m_kid.getX()) > VERTICE_AREA_OBSERVACAO.x) 
		|| (abs(m_kid.getY()) > VERTICE_AREA_OBSERVACAO.y))
	{
		m_area = AreaTrabalho::Area::Externa;
	}
	else
	{
		if ((abs(m_kid.getX()) > VERTICE_AREA_INTERACAO.x)
			|| (abs(m_kid.getY()) > VERTICE_AREA_INTERACAO.y))
		{
			m_area = AreaTrabalho::Area::Observacao;
		}
		else
		{
			m_area = AreaTrabalho::Area::Interacao;
		}
	}
}

float AreaTrabalho::obtemProximidadeComBorda() {
	float delta_x{0.0f};
	float delta_y{0.0f};
	float px{(float) abs(m_pose_robo.pose.pose.position.x)};
	float py{(float) abs(m_pose_robo.pose.pose.position.y)};

	// verifica se está na área de influência da borda
	delta_x = px - VERTICE_AREA_TRISTEZA.x;
	delta_y = px - VERTICE_AREA_TRISTEZA.y;

	if ((delta_x > 0.0f) && (delta_y > 0.0f)) {
		delta_x = 1.0f - (VERTICE_AREA_INTERACAO.x - px) / (VERTICE_AREA_INTERACAO.x - VERTICE_AREA_TRISTEZA.x);
		delta_y = 1.0f - (VERTICE_AREA_INTERACAO.y - py) / (VERTICE_AREA_INTERACAO.y - VERTICE_AREA_TRISTEZA.y);
	}
	else {
		delta_x = 0.0f;
		delta_y = 0.0f;
	}				

	if (delta_x > delta_y) {
		return delta_x;
	}
	else {
		return delta_y;
	}
}

float AreaTrabalho::obtemDistanciaObservacao()
{
    float delta_x;
    float delta_y;
    float dist_obs{0.0f};

    if (m_area == AreaTrabalho::Area::Observacao)
	{
		delta_x = abs(m_kid.getX()) - VERTICE_AREA_INTERACAO.x;
		delta_y = abs(m_kid.getY()) - VERTICE_AREA_INTERACAO.y;
		
		if (delta_x < 0.0f)
		{
			dist_obs = abs(delta_y / sin(m_kid.getTh()));
		}
		
		if (delta_y < 0.0f)
		{
			dist_obs = abs(delta_x / cos(m_kid.getTh()));
		}
	}

	return dist_obs;
}