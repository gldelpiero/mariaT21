/**
 * control law
 * 
 */

#include <ros/ros.h>
#include <general_functions.h>

// To publish
#include <geometry_msgs/Twist.h>

// To subscribe
#include <child_detection/ChildDetection.h>
#include <workspace/WorkSpace.h>
#include <state_machine/DesiredDistance.h>

#ifndef TESTE_CONTROLADOR
    #define TESTE_CONTROLADOR 0
#endif

#ifndef TESTE_MEDIDOR
    #define TESTE_MEDIDOR 0
#endif

#ifndef TESTE_SEM_FATOR
    #define TESTE_SEM_FATOR 0
#endif

// Control Law's constants
const double KV = 0.1;
const double KW = 0.5;

ros::Publisher pub;

child_detection::ChildDetection m_child_detection;
workspace::WorkSpace m_workspace;
state_machine::DesiredDistance m_state_machine;

double m_last_distance;

/**
 * publish linear and angular velocities to the robot
 * 
 * @param linear linear velocity [m/s]
 * @param angular angular velocity [rad/s]
 * 
 */
void publishVelocities(
	const double& linear, 
	const double& angular)
{
	geometry_msgs::Twist vel;

	vel.linear.x = linear;
	vel.angular.z = angular;

    ROS_INFO_STREAM("[Control law] linear velocity: "
        << linear
        << "\tAngular velocity: "
        << angular);

	pub.publish(vel);
}

void executeControlLaw() {
    double distance;
    double delta_distance;
    double spacing_factor;
    double rad;
    double linear;
    double angular;

    distance = m_child_detection.distance;

#if TESTE_CONTROLADOR
    ROS_INFO("Teste de controlador: Distancia de observacao e Distancia desejada foram ignoradas.");
#else 
    // If the child is in the observation area, then ignores 'observation distance'
    if (m_workspace.child_observation_distance >= 0.0) {
       // distance -= m_workspace.child_observation_distance; 
       ROS_INFO_STREAM("[control law ] execute: Observation distance: " << m_workspace.child_observation_distance);
    }
    else {
        ROS_INFO_STREAM("[control law ] execute: Observation distance negative");
    }
    distance -= m_workspace.child_observation_distance;

    // Compute the distance to be corrected
    distance -= m_state_machine.desired_distance;
#endif     

    delta_distance = distance - m_last_distance;
    m_last_distance = distance;

    // Spacing factor (To allow the child to go away without following him/her)
    spacing_factor = 1.0;
    if (delta_distance > 0.0) {
        spacing_factor = 1.0 / (1.0 + exp(100.0 * delta_distance));
    }

    rad = GeneralFunctions::degToRad(m_child_detection.angle);

    // Compute linear velocity
    linear = 0.0;

#if TESTE_CONTROLADOR
        linear = KV * distance * cos(rad);
#else
    if (m_workspace.child_area != workspace::WorkSpace::CHILD_AREA_EXTERNAL) {
        linear = KV * distance * cos(rad);
    }
#endif 

#if !TESTE_SEM_FATOR
    linear *= spacing_factor;
#endif

    // Compute angular velocity
    angular = 0.0;

    if ( ! GeneralFunctions::doubleCompare(distance, 0.0)) {
        angular = KW * tanh(rad) + linear * sin(rad) / distance;
    }

#if TESTE_MEDIDOR
    publishVelocities(0.0, 0.0); // O robô ficará parado
#else
    publishVelocities(linear, angular);
#endif
}

void childDetectionCallback(const child_detection::ChildDetection::ConstPtr& msg) {
    m_child_detection.angle = msg->angle;
    m_child_detection.detected = msg->detected;
    m_child_detection.distance = msg->distance;
    
    m_child_detection.child_position.angle = msg->child_position.angle;
    m_child_detection.child_position.x = msg->child_position.x;
    m_child_detection.child_position.y = msg->child_position.y;
}

void workspaceCallback(const workspace::WorkSpaceConstPtr& msg) {
    m_workspace.child_area = msg->child_area;
    m_workspace.child_observation_distance = msg->child_observation_distance;
    m_workspace.robot_bounds_proximity = msg->robot_bounds_proximity;
}

void stateMachineCallback(const state_machine::DesiredDistanceConstPtr& msg) {
    m_state_machine.desired_distance = msg->desired_distance;
}

int main (int argc, char** argv) {
	ros::init(argc, argv, "control_law");	
	ros::NodeHandle n;

    ros::Subscriber sub_child_detection = n.subscribe("child_detection/state", 1000, &childDetectionCallback);
    ros::Subscriber sub_workspace = n.subscribe("workspace/state", 1000, &workspaceCallback);
    ros::Subscriber sub_state_machine = n.subscribe("state_machine/desired_distance", 1000, &stateMachineCallback);

    pub = n.advertise<geometry_msgs::Twist>("RosAria/cmd_vel", 1000);

    if (sub_child_detection
    && sub_state_machine
    && sub_workspace
    && pub) {
        ROS_INFO("Control Law");
        ROS_INFO("\tSubscriber to child_detection/state");
        ROS_INFO("\tSubscriber to workspace/state");
        ROS_INFO("\tSubscriber to state_machine/desired_distance");
        ROS_INFO("\tPublisher as RosAria/cmd_vel");
        
        ros::Rate loop_rate(10); // 10 Hz
        while (ros::ok()) {

            executeControlLaw();

            ros::spinOnce();
            loop_rate.sleep();
        }
    }
	else {
		ROS_INFO_STREAM("Error on subscriber or publisher!\n");
	}	
	return 0;
}