#include "../include/Kid.h"

Kid::Kid() {
    m_x = 0.0;
    m_y = 0.0;
    m_th = 0.0;
    m_th_obs = 0.0;
    m_robot_y = 0.0;
    m_robot_x = 0.0;
}

void Kid::updateChildPosition(const child_detection::ChildDetection::ConstPtr& state) {
    m_x = state->child_position.x;
    m_y = state->child_position.y;
    m_th = state->child_position.angle;

    m_th_obs = GeneralFunctions::radToDeg(atan2(m_y - m_robot_y, m_x - m_robot_x));
}

void Kid::updateRobotPosition(const double x, const double y) {
    m_robot_x = x;
    m_robot_y = y;

    m_th_obs = GeneralFunctions::radToDeg(atan2(m_y - m_robot_y, m_x - m_robot_x));
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

double Kid::getThObs() {
    return m_th_obs;
}