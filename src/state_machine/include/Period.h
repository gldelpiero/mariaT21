#ifndef _PERIOD_H_
#define _PERIOD_H_

#include <chrono>
#include <string>
#include <ros/ros.h>

class Period {

public:
    Period();

    bool isOn();
    void turnOn();
    void turnOff();
    void reset();
    double getSeconds();

    void setName(std::string name);

private:
    bool m_isOn;
    std::string m_name;

    std::chrono::steady_clock::time_point m_start;
};

#endif