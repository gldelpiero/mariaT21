/**
 * Detection of robot's emotions
 * 
 * (C) Giancarlo
 * 
 */

#include <ros/ros.h>
#include <state_machine/OnChange.h>
#include <emotion_detection/Vector4d.h>
#include "../include/EmotionHypercube.h"
#include <workspace/WorkSpace.h>

#define DECAY_CONSTANT 1
#define BOUND_FEAR 10.0

ros::Publisher pub;
EmotionHypercube emotionHypercube;

void decayEmotion() {
    double v;

    emotionHypercube.decay(DECAY_CONSTANT);
}

void publish() {
    emotion_detection::Vector4d msg;

    msg.header.stamp = ros::Time::now();
    msg.x = emotionHypercube.getX();
    msg.y = emotionHypercube.getY();
    msg.z = emotionHypercube.getZ();
    msg.w = emotionHypercube.getW();

    ROS_INFO_STREAM("[Emotion detection] : x " << msg.x);
    ROS_INFO_STREAM("                    : y " << msg.y);
    ROS_INFO_STREAM("                    : z " << msg.z);
    ROS_INFO_STREAM("                    : w " << msg.w);

    pub.publish(msg);
}

void workspaceCallback(const workspace::WorkSpace::ConstPtr& msg) {
    if (msg->robot_bounds_proximity >= 0.0) {
        emotionHypercube.setZ(BOUND_FEAR * msg->robot_bounds_proximity);
    }
}

void onChangeCallback(const state_machine::OnChange::ConstPtr& msg) {
    if ((msg->current == state_machine::OnChange::PUBLIC)
    && (msg->last == state_machine::OnChange::SOCIAL_PUBLIC)) {
        emotionHypercube.setX(-100.0); // Emotion is changed to sad (100%)
    }

    if (msg->current == state_machine::OnChange::SOCIAL) {
        if (msg->last == state_machine::OnChange::SOCIAL_PUBLIC) {
            emotionHypercube.setX(50.0); // Emotion is changed to happy (50%)
        }
        if (msg->last == state_machine::OnChange::PERSONAL_SOCIAL) {
            emotionHypercube.setX(-50.0); // Emotion is changed to sad (50%)
        }
    }

    if ((msg->current == state_machine::OnChange::PERSONAL)
    && (msg->last == state_machine::OnChange::PERSONAL_SOCIAL)) {
        emotionHypercube.setX(100.0); // Emotion is changed to happy (100%)
    }
}

int main (int argc, char** argv) {
	ros::init(argc, argv, "emotion_detection");	
	ros::NodeHandle n;

    ros::Subscriber sub_onChange = n.subscribe("state_machine/on_change", 1000, &onChangeCallback);
    ros::Subscriber sub_workspace = n.subscribe("workspace/state", 1000, &workspaceCallback);

    pub = n.advertise<emotion_detection::Vector4d>("emotion_detection/state", 1000);

    if (sub_onChange && pub) {
        ROS_INFO("Emotion Detection");
        ROS_INFO("  Subscriber to: state_machine/on_change");
        ROS_INFO("  Publisher as emotion_detection/state");

        ros::Rate loop_rate(10); // 10 Hz
        while (ros::ok()) {            
            decayEmotion();
            publish();

            ros::spinOnce();
            loop_rate.sleep();            
        }
    }
	else {
		ROS_INFO_STREAM("Error on subscriber or publisher!\n");
	}	
	return 0;
}