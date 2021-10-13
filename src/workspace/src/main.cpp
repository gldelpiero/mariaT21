/**
 * This node implements WorkSpace specification
 * 
 * (C) 2021
 * 
 * Giancarlo Pedroni Del Piero
 */

#include <ros/ros.h>
#include "WorkArea.h"

#include <child_detection/ChildDetection.h>
#include <workspace/WorkSpace.h>

ros::Publisher  pub;
WorkArea        work_area;

void update() {
    workspace::WorkSpace msg;

    msg.header.stamp = ros::Time::now();
    msg.child_observation_distance = work_area.getChildObservationDistance();
    msg.robot_bounds_proximity = work_area.getRobotBoundsProximity();
    msg.child_area = (uint8_t) work_area.getChildArea();

    ROS_INFO_STREAM("[ workspace ] Obs dist: " << msg.child_observation_distance);

    if (msg.child_area == workspace::WorkSpace::CHILD_AREA_EXTERNAL) {
        ROS_INFO_STREAM("              Child area: " << int(msg.child_area) << " External");
    }
    else {
        if (msg.child_area == workspace::WorkSpace::CHILD_AREA_INTERACTION) {
            ROS_INFO_STREAM("              Child area: " << int(msg.child_area) << " Interaction");
        }
        else {
            ROS_INFO_STREAM("              Child area: " << int(msg.child_area) << " Observation");
        }
    }


    pub.publish(msg);
}

void childDetectionCallback(const child_detection::ChildDetection::ConstPtr& state) {
    work_area.updateChildPosition(state);
}

void poseCallback(const nav_msgs::Odometry::ConstPtr& msg) {
    work_area.updateRobotPosition(msg);
}

int main (int argc, char** argv) {
	ros::init(argc, argv, "workspace");	
	ros::NodeHandle n;

    ros::Subscriber sub_child_detection = n.subscribe("child_detection/state", 1000, &childDetectionCallback);
    ros::Subscriber sub_pose = n.subscribe("RosAria/pose", 1000, &poseCallback);
    pub = n.advertise<workspace::WorkSpace>("workspace/state", 1000);

    if (sub_child_detection && sub_pose && pub) {
        ROS_INFO("Workspace");
        ROS_INFO("\tSubscriber to child_detection/state");
        ROS_INFO("\tSubscriber to RosAria/pose");
        ROS_INFO("\tPublisher as workspace/state");

        ros::Rate loop_rate(10); // 10 Hz
        while (ros::ok()) {
            update();
            ros::spinOnce();
            loop_rate.sleep();
        }        
    }
	else {
		ROS_INFO_STREAM("Error on subscriber or publisher!\n");
	}	
	return 0;
}
