#ifndef _KID_H_
#define _KID_H_

#include <nav_msgs/Odometry.h>
#include <ros/ros.h>
#include "Funcoes.h"
#include <string>

class Kid {
public:
    Kid();
    void setPose(nav_msgs::Odometry pose_robo, double distancia, double angulo);
    double getX();
    double getY();
    double getTh();
    void showROS();
    void copy(Kid kid);

private:
    double m_x;
    double m_y;
    double m_th;
};

#endif