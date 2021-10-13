cmake_minimum_required(VERSION 3.0.2)
project(emotion_detection)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  message_generation
  state_machine
  workspace
)

add_message_files(FILES Vector4d.msg)

generate_messages(DEPENDENCIES std_msgs)

catkin_package(CATKIN_DEPENDS message_runtime)

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(emotion_detection src/main.cpp src/EmotionHypercube.cpp)

target_link_libraries(emotion_detection ${catkin_LIBRARIES})