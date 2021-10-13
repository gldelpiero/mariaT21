#include "Kid.h"

Kid::Kid() {
    m_x = 0.0;
    m_y = 0.0;
    m_th = 0.0;
}

void Kid::copy(Kid kid) {
    m_x = kid.getX();
    m_y = kid.getY();
    m_th = kid.getTh();
}

void Kid::showROS() {
    ROS_INFO("Kid at (%.2f, %.2f)\n", m_x, m_y);
}

void Kid::setPose(nav_msgs::Odometry pose_robo, double distancia, double angulo) {
    m_x = pose_robo.pose.pose.position.x;
    m_y = pose_robo.pose.pose.position.y;
    
    double th = quaternions2angle(pose_robo.pose.pose.orientation.z, pose_robo.pose.pose.orientation.w);
	double rad = deg2rad(angulo + th);

	m_x += distancia * cos(rad);
	m_y += distancia * sin(rad);
    m_th = rad;
}

double Kid::getX() {
    return m_x;
}

double Kid::getY() {
    return m_y;
}

double Kid::getTh() {
    return m_th;
}