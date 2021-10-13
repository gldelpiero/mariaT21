/**
 * This node implements State Machine specification
 * 
 * (C) 2021
 * 
 * Giancarlo Pedroni Del Piero
 */

#include <ros/ros.h>
#include "../include/StateMachine.h"

// To subscrib
#include <child_detection/ChildDetection.h>

// To publish
#include <state_machine/DesiredDistance.h>
#include <state_machine/OnChange.h>

ros::Publisher pub_distance;
ros::Publisher pub_onChange;

StateMachine m_state_machine;

void onChangeStateMachine(StateMachine::ProxemicArea last, StateMachine::ProxemicArea current) {
    state_machine::OnChange msg;

    msg.header.stamp = ros::Time::now();
    msg.last = (uint8_t) last;
    msg.current = (uint8_t) current;

    pub_onChange.publish(msg);
}

void publish_distance() {
    state_machine::DesiredDistance msg;

    msg.header.stamp = ros::Time::now();
    msg.desired_distance = m_state_machine.getDesiredDistance();

    ROS_INFO_STREAM("Desired distance:" << msg.desired_distance);

    pub_distance.publish(msg);
}

void childDetectionCallback(const child_detection::ChildDetection::ConstPtr& state) {
    ROS_INFO_STREAM("Child detection callback: " << state->distance);
    m_state_machine.setDistance(state->distance);
    publish_distance();
}

int main (int argc, char** argv) {
	ros::init(argc, argv, "state_machine");	
	ros::NodeHandle n;

    ros::Subscriber sub_child_detection = n.subscribe("child_detection/state", 1000, &childDetectionCallback);

    pub_distance = n.advertise<state_machine::DesiredDistance>("state_machine/desired_distance", 1000);
    pub_onChange = n.advertise<state_machine::OnChange>("state_machine/on_change", 1000);

    if (sub_child_detection && pub_distance && pub_onChange) {
        ROS_INFO("State Machine");
        ROS_INFO("  Subscriber to: child_detection/state");
        ROS_INFO("  Publisher as: state_machine/desired_distance");
        ROS_INFO("  Publisher as: state_machine/on_change");        

        m_state_machine.setOnChangeCallback(*onChangeStateMachine);

        ros::Rate loop_rate(10); // 10 Hz
        while (ros::ok()) {
            ros::spinOnce();
            loop_rate.sleep();
        }
    }
	else {
		ROS_INFO_STREAM("Error on subscriber or publisher!\n");
	}	
	return 0;
}