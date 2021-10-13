/**
 * This node implements Log
 * 
 * (C) 2021
 * 
 * Giancarlo Pedroni Del Piero
 */

#include <ros/ros.h>
// To subscrib
#include <child_detection/ChildDetection.h>
#include <emotion_detection/Vector4d.h>
#include <state_machine/DesiredDistance.h>
#include <state_machine/OnChange.h>
#include <workspace/WorkSpace.h>
#include <testekid/Position.h>
#include <nav_msgs/Odometry.h>

#include <termios.h>
#include <time.h>
#include <fstream>
#include <string>

std::ofstream fileChildDetection;
std::ofstream fileEmotionDetection;
std::ofstream fileStateMachineDistance;
std::ofstream fileStateMachineOnChange;
std::ofstream fileWorkspace;
std::ofstream fileTestekid;
std::ofstream filePose;

void createFileName(std::string& name, const std::string firstName) {
    struct tm* stm;
    time_t n;

    n = time(0);
    stm = localtime(&n);

    name = "./log/";

    name.append(firstName);

    name.append("_");

    name.append(std::to_string(stm->tm_year + 1900));
    if (stm->tm_mon+1 < 10) {
        name.append("0");
    }
    name.append(std::to_string(stm->tm_mon+1));
    if (stm->tm_mday < 10) {
        name.append("0");
    }
    name.append(std::to_string(stm->tm_mday));

    name.append("_");
    if (stm->tm_hour < 10) {
        name.append("0");
    }
    name.append(std::to_string(stm->tm_hour));
    if (stm->tm_min < 10) {
        name.append("0");
    }
    name.append(std::to_string(stm->tm_min));
    if (stm->tm_sec < 10) {
        name.append("0");
    }
    name.append(std::to_string(stm->tm_sec));
}

char getch() {
	fd_set set;
	struct timeval timeout;
	int rv;
	char buff = 0;
	int len = 1;
	int filedesc = 0;
	FD_ZERO(&set);
	FD_SET(filedesc, &set);
	
	timeout.tv_sec = 0;
	timeout.tv_usec = 1000;

	rv = select(filedesc + 1, &set, NULL, NULL, &timeout);

	struct termios old = {0};
	if (tcgetattr(filedesc, &old) < 0)
		ROS_ERROR("tcsetattr()");
	old.c_lflag &= ~ICANON;
	old.c_lflag &= ~ECHO;
	old.c_cc[VMIN] = 1;
	old.c_cc[VTIME] = 0;
	if (tcsetattr(filedesc, TCSANOW, &old) < 0)
		ROS_ERROR("tcsetattr ICANON");

	if(rv == -1) {
		ROS_ERROR("select");
    }
	else {
        if(rv == 0) {
		//ROS_INFO("no_key_pressed");
        }
	    else { 
		    read(filedesc, &buff, len );
        }
    }

	old.c_lflag |= ICANON;
	old.c_lflag |= ECHO;
	if (tcsetattr(filedesc, TCSADRAIN, &old) < 0)
		ROS_ERROR ("tcsetattr ~ICANON");
	return (buff);
}

void childDetectionCallback(const child_detection::ChildDetection::ConstPtr& state) {
//    ROS_INFO_STREAM("Child detection callback");

    fileChildDetection
        << std::fixed << std::setprecision(8) << state->header.stamp.toSec() << ","
        << (state->detected ? "1" : "0") << ","
        << state->distance << ","
        << state->angle << ","
        << state->child_position.x << ","
        << state->child_position.y << ","
        << state->child_position.angle << std::endl;
}

void emotionDetectionCallback(const emotion_detection::Vector4d::ConstPtr& state) {
//    ROS_INFO_STREAM("Emotion Detection Callback");

    fileEmotionDetection
        << std::fixed << std::setprecision(8) << state->header.stamp.toSec() << ","
        << state->x << ","
        << state->y << ","
        << state->z << ","
        << state->w << std::endl;
}

void stateMachineDistanceCallback(const state_machine::DesiredDistance::ConstPtr& state) {
//    ROS_INFO("State Machine Distance Desired Callback");

    fileStateMachineDistance
        << std::fixed << std::setprecision(8) << state->header.stamp.toSec() << ","
        << state->desired_distance << std::endl;
}

void stateMachineOnChangeCallback(const state_machine::OnChange::ConstPtr& state) {
//    ROS_INFO("State Machine OnChange Callback");

    fileStateMachineOnChange
        << std::fixed << std::setprecision(8) << state->header.stamp.toSec() << ","
        << int(state->last) << ","
        << int(state->current) << std::endl;
}

void workspaceCallback(const workspace::WorkSpace::ConstPtr& state) {
//    ROS_INFO("Workscape callback");

    fileWorkspace
        << std::fixed << std::setprecision(8) << state->header.stamp.toSec() << ","
        << int(state->child_area) << ","
        << state->child_observation_distance << ","
        << state->robot_bounds_proximity << std::endl;
}

void testekidCallback(const testekid::Position::ConstPtr& msg) {
//    ROS_INFO("testekid callback");

    fileTestekid
        << std::fixed << std::setprecision(8) << msg->header.stamp.toSec() << ","
        << msg->x << ","
        << msg->y << std::endl;
}

void poseCallback(const nav_msgs::Odometry::ConstPtr& msg) {
//    ROS_INFO("pose callback");

    filePose
        << std::fixed << std::setprecision(8) << msg->header.stamp.toSec() << ","
        << msg->twist.twist.linear.x << "," 
        << msg->twist.twist.angular.z << ","
        << msg->pose.pose.position.x << ","
        << msg->pose.pose.position.y << std::endl;
}

int main (int argc, char** argv) {
    bool blnContinue = true;
    int c;
    std::string fileName;
    
    ros::init(argc, argv, "marialog");	
	ros::NodeHandle n;

    ros::Subscriber sub_child_detection = n.subscribe("child_detection/state", 1000, &childDetectionCallback);
    ros::Subscriber sub_emotion_detection = n.subscribe("emotion_detection/state", 1000, &emotionDetectionCallback);
    ros::Subscriber sub_state_machine_distance = n.subscribe("state_machine/desired_distance", 1000, &stateMachineDistanceCallback);
    ros::Subscriber sub_state_machine_onchange = n.subscribe("state_machine/on_change", 1000, &stateMachineOnChangeCallback);
    ros::Subscriber sub_workspace = n.subscribe("workspace/state", 1000, &workspaceCallback);
    ros::Subscriber sub_testekid = n.subscribe("testekid/position", 1000, &testekidCallback);
    ros::Subscriber sub_pose = n.subscribe("RosAria/pose", 1000, &poseCallback);

    if (sub_child_detection
    && sub_emotion_detection
    && sub_state_machine_distance
    && sub_state_machine_onchange
    && sub_workspace
    && sub_testekid
    && sub_pose) {
        
        ROS_INFO("Maria Log");
        ROS_INFO("\tSubscriber to child_detection/state");
        ROS_INFO("\tSubscriber to emotion_detection/state");
        ROS_INFO("\tSubscriber to state_machine/desired_distance");
        ROS_INFO("\tSubscriber to state_machine/on_change");
        ROS_INFO("\tSubscriber to workspace/state");
        ROS_INFO("\tSubscriber to testekid/position");
        ROS_INFO("\tSubscriber to RosAria/pose");
        
        createFileName(fileName, "log_child_detection");
        ROS_INFO_STREAM("\tChild detection filename:" << fileName);
        fileChildDetection.open(fileName);

        createFileName(fileName, "log_emotion_detection");
        ROS_INFO_STREAM("\tEmotion detection filename:" << fileName);
        fileEmotionDetection.open(fileName);

        createFileName(fileName, "log_state_machine_distance");
        ROS_INFO_STREAM("\tState machine Distance filename:" << fileName);
        fileStateMachineDistance.open(fileName);

        createFileName(fileName, "log_state_machine_onchange");
        ROS_INFO_STREAM("\tState machine On change filename:" << fileName);
        fileStateMachineOnChange.open(fileName);

        createFileName(fileName, "log_workspace");
        ROS_INFO_STREAM("\tWorkspace filename:" << fileName);
        fileWorkspace.open(fileName);

        createFileName(fileName, "log_testekid");
        ROS_INFO_STREAM("\tTestekid filename:" << fileName);
        fileTestekid.open(fileName);

        createFileName(fileName, "log_pose");
        ROS_INFO_STREAM("\tPose filename:" << fileName);
        filePose.open(fileName);

        fileChildDetection << "Seconds,Detected,Distance,Angle,Child.X,Child.Y,Child.Angle" << std::endl;
        fileEmotionDetection << "Seconds,x,y,z,w" << std::endl;
        fileStateMachineDistance << "Seconds,Desired Distance" << std::endl;
        fileStateMachineOnChange << "Seconds,Last,Current" << std::endl;
        fileWorkspace << "Seconds,ChildArea,Child Observation Distance,Robot bounds proximity" << std::endl;
        fileTestekid << "Seconds,X,Y" << std::endl;
        filePose << "Seconds, Linear Velocity, Angular Velocitiy,X,Y" << std::endl;

        ros::Rate loop_rate(10); // 10 Hz
        while (ros::ok() && blnContinue) {
            c = 0;
            c = getch(); // It is necessary to do not blocks the loop
            blnContinue = (c != 'q');
            ros::spinOnce();
            loop_rate.sleep();
        }

        fileChildDetection.flush();
        fileEmotionDetection.flush();
        fileStateMachineDistance.flush();
        fileStateMachineOnChange.flush();
        fileWorkspace.flush();
        fileTestekid.flush();
        filePose.flush();

        fileChildDetection.close();
        fileEmotionDetection.close();
        fileStateMachineDistance.close();
        fileStateMachineOnChange.close();
        fileWorkspace.close();
        fileTestekid.close();
        filePose.close();
    }
	else {
		ROS_INFO_STREAM("Error on subscriber or publisher!\n");
	}	
	return 0;
}