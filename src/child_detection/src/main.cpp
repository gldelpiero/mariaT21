#include <ros/ros.h>
#include "general_functions.h"

// Subscriber messages
#include <sensor_msgs/LaserScan.h>
#include <nav_msgs/Odometry.h>

// Publisher message
#include <child_detection/ChildDetection.h>


ros::Publisher pub;

double m_robot_x{0.0};
double m_robot_y{0.0};
double m_robot_th{0.0};

double adjustAngle(double angle) {
    if (angle < 180.0) {
        return -angle;
    }
    else {
        if (angle >= 180.0) {
            return 360.0 - angle;
        }
        else {
            return 0.0;
        }
    }
}

void poseCallback(const nav_msgs::Odometry::ConstPtr& msg) {
    m_robot_x = msg->pose.pose.position.x;
	m_robot_y = msg->pose.pose.position.y;
	m_robot_th = GeneralFunctions::quaternionsToAngle(msg->pose.pose.orientation.z, msg->pose.pose.orientation.w);
}

void scanCallback(const sensor_msgs::LaserScan::ConstPtr& scan) {
	int L = scan->ranges.size();
	int index{-1};
	int degree{0};
	double value{std::numeric_limits<float>::infinity()};
    child_detection::ChildDetection msg;

    msg.header.stamp = ros::Time::now();

	// Invalid values are defined as infinity
	for (unsigned int i = 0u; i < L; i++) {
		if (scan->ranges[i] < value) {
			value = scan->ranges[i];
			index = i;
		}
	}
			
	// Is there an object?
	if (index > -1) {
		degree = (int) adjustAngle(
			round(
				GeneralFunctions::radToDeg(scan->angle_min + scan->angle_increment * index)
			)
		);

        msg.detected = true;
        msg.angle = degree;
        msg.distance = value;

		msg.child_position.angle = m_robot_th + degree;
		double rad = GeneralFunctions::degToRad(msg.child_position.angle);

		msg.child_position.x = m_robot_x + value * cos(rad);
		msg.child_position.y = m_robot_y + value * sin(rad);
		
	}
	else {
        msg.detected = false;
        msg.angle = 0;
        msg.distance = 0.0;
		msg.child_position.x = m_robot_x;
		msg.child_position.y = m_robot_y;
		msg.child_position.angle = m_robot_th;
	}

	ROS_INFO_STREAM("[ Child detection ] Angle: " << msg.angle);
	ROS_INFO_STREAM("                    Distance: " << msg.distance);
	ROS_INFO_STREAM("                    Child.x: " << msg.child_position.x);
	ROS_INFO_STREAM("                    Child.y: " << msg.child_position.y);
	ROS_INFO_STREAM("                    Child.angle: " << msg.child_position.angle);

    pub.publish(msg);
}

int main (int argc, char** argv) {
	ros::init(argc, argv, "child_detection");	
	ros::NodeHandle n;

    ros::Subscriber sub_scan = n.subscribe("testekid/laserscan", 1000, &scanCallback);
    ros::Subscriber sub_pose = n.subscribe("RosAria/pose", 1000, &poseCallback);

    pub = n.advertise<child_detection::ChildDetection>("child_detection/state", 1000);

    if (sub_scan && sub_pose && pub) {
        ROS_INFO("Child Detection");
		ROS_INFO("\tSubscriber to testekid/laserscan");
		ROS_INFO("\tSubscriber to Rosaria/pose");
		ROS_INFO("\tPublisher as child_detection/state");

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