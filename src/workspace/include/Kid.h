#ifndef _KID_H_
#define _KID_H_

#include <general_functions.h>
#include <child_detection/ChildDetection.h>
#include <math.h>

class Kid {
public:
    Kid();

    void updateChildPosition(const child_detection::ChildDetection::ConstPtr& state);
    void updateRobotPosition(const double x, const double y);

    double getX();
    double getY();
    double getTh();
    double getThObs();

private:
    double m_x;
    double m_y;
    double m_th;

    double m_robot_x;
    double m_robot_y;
    
    double m_th_obs;
};

#endif