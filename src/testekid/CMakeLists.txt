cmake_minimum_required(VERSION 3.0.2)
project(testekid)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  sensor_msgs
  nav_msgs
  rosaria
  general_functions
  message_generation
)

add_message_files(FILES Position.msg)

generate_messages(DEPENDENCIES std_msgs)

catkin_package(CATKIN_DEPENDS message_runtime)

include_directories(${catkin_INCLUDE_DIRS})

add_executable(testekid src/main.cpp)
target_link_libraries(testekid ${catkin_LIBRARIES})