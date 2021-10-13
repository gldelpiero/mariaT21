#ifndef _WORKAREA_H_
#define _WORKAREA_H

#include "Kid.h"
#include <nav_msgs/Odometry.h>

typedef struct point_ {
	double x;
	double y;
} Point;

const Point OBSERVATION_AREA_VERTEX = {6.0, 5.0};
const Point INTERACTION_AREA_VERTEX = {5.0, 4.0};
const Point SADNESS_AREA_VERTEX = {4.0, 3.0};

class WorkArea {
public:
    enum class Area {
	    External = 0u,
	    Observation = 1u,
	    Interaction = 2u
    };

    void    updateChildPosition(const child_detection::ChildDetection::ConstPtr& state);
    void    updateRobotPosition(const nav_msgs::Odometry::ConstPtr& msg);

    double  getRobotBoundsProximity();
    double  getChildObservationDistance();
    Area    getChildArea();

private:
    Kid m_kid;
    Area m_area;
    double m_robot_x;
    double m_robot_y;

    void setArea();
};

#endif