#include "../include/Period.h"

Period::Period() {
    m_isOn = false;
}

void Period::setName(std::string name) {
    m_name = name;
}

bool Period::isOn() {
    return m_isOn;
}

void Period::turnOn() {
    ROS_INFO_STREAM("Period [" << m_name << "]::turnOn()");
    m_isOn = true;
    m_start = std::chrono::steady_clock::now();
}

void Period::turnOff() {
    ROS_INFO_STREAM("Period [" << m_name << "]::turnOff()");
    m_isOn = false;
}

void Period::reset() {
    turnOff();
    turnOn();
}

double Period::getSeconds() {
    if (m_isOn) {
        std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
        return std::chrono::duration_cast<std::chrono::milliseconds>(end - m_start).count() / 1000.0;
    }
    else {
        return 0.0;
    }    
}