#include "WorkArea.h"

void WorkArea::updateChildPosition(const child_detection::ChildDetection::ConstPtr& state) {
	m_kid.updateChildPosition(state);
    setArea();
}

void WorkArea::updateRobotPosition(const nav_msgs::Odometry::ConstPtr& msg) {
	m_robot_x = msg->pose.pose.position.x;
	m_robot_y = msg->pose.pose.position.y;
	m_kid.updateRobotPosition(m_robot_x, m_robot_y);
}

WorkArea::Area WorkArea::getChildArea() {
    return m_area;
}

void WorkArea::setArea() {
	if ((abs(m_kid.getX()) > OBSERVATION_AREA_VERTEX.x) 
    || (abs(m_kid.getY()) > OBSERVATION_AREA_VERTEX.y)) {
		m_area = WorkArea::Area::External;
	}
	else {
		if ((abs(m_kid.getX()) > INTERACTION_AREA_VERTEX.x)
		|| (abs(m_kid.getY()) > INTERACTION_AREA_VERTEX.y)) {
			m_area = WorkArea::Area::Observation;
		}
		else {
			m_area = WorkArea::Area::Interaction;
		}
	}
}

double WorkArea::getRobotBoundsProximity() {
	double delta_x{0.0};
	double delta_y{0.0};
	double px{abs(m_robot_x)};
	double py{abs(m_robot_y)};

	// verifica se está na área de influência da borda
	delta_x = px - SADNESS_AREA_VERTEX.x;
	delta_y = px - SADNESS_AREA_VERTEX.y;

	if ((delta_x > 0.0) && (delta_y > 0.0)) {
		delta_x = 1.0 - (INTERACTION_AREA_VERTEX.x - px) / (INTERACTION_AREA_VERTEX.x - SADNESS_AREA_VERTEX.x);
		delta_y = 1.0 - (INTERACTION_AREA_VERTEX.y - py) / (INTERACTION_AREA_VERTEX.y - SADNESS_AREA_VERTEX.y);
	}
	else {
		delta_x = 0.0;
		delta_y = 0.0;
	}				

	if (delta_x > delta_y) {
		return delta_x;
	}
	else {
		return delta_y;
	}
}

double WorkArea::getChildObservationDistance() {
    double delta_x;
    double delta_y;
    double dist_obs{0.0};

    if (m_area == WorkArea::Area::Observation) {
		delta_x = abs(m_kid.getX()) - INTERACTION_AREA_VERTEX.x;
		delta_y = abs(m_kid.getY()) - INTERACTION_AREA_VERTEX.y;
		
		if (delta_y > 0.0) {
			dist_obs = abs(delta_y / sin(GeneralFunctions::degToRad(m_kid.getThObs())));
		}
		
		if (delta_x > 0.0) {
			dist_obs = abs(delta_x / cos(GeneralFunctions::degToRad(m_kid.getThObs())));
		}

		if (dist_obs < 0.0) {
			dist_obs = 0.0;
		}
	}
	return dist_obs;
}