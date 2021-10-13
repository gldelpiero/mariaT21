###############################
# Inicia o pacote Aria do ROS #
###############################

# Prepare to call
source devel/setup.bash

# The default port is /dev/ttyUSB0
rosrun rosaria RosAria _publish_aria_lasers:=false _port:=MARIA:8101 # 192.168.0.11:8101

# To specify the port as /dev/ttyS0 (COM1, normal for most robot onboard computers) instead, use: 
# rosrun rosaria RosAria _port:=/dev/ttys0

# If you have a robot with a wireless ethernet-serial bridge device with IP address 10.0.126.32, use the following command instead: 
# rosrun rosaria RosAria _port:=10.0.126.32:8101
