# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/giancarlo/Dropbox/mariaT21/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/giancarlo/Dropbox/mariaT21/build

# Utility rule file for workspace_generate_messages_cpp.

# Include the progress variables for this target.
include workspace/CMakeFiles/workspace_generate_messages_cpp.dir/progress.make

workspace/CMakeFiles/workspace_generate_messages_cpp: /home/giancarlo/Dropbox/mariaT21/devel/include/workspace/WorkSpace.h


/home/giancarlo/Dropbox/mariaT21/devel/include/workspace/WorkSpace.h: /opt/ros/noetic/lib/gencpp/gen_cpp.py
/home/giancarlo/Dropbox/mariaT21/devel/include/workspace/WorkSpace.h: /home/giancarlo/Dropbox/mariaT21/src/workspace/msg/WorkSpace.msg
/home/giancarlo/Dropbox/mariaT21/devel/include/workspace/WorkSpace.h: /opt/ros/noetic/share/std_msgs/msg/Header.msg
/home/giancarlo/Dropbox/mariaT21/devel/include/workspace/WorkSpace.h: /opt/ros/noetic/share/gencpp/msg.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/giancarlo/Dropbox/mariaT21/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating C++ code from workspace/WorkSpace.msg"
	cd /home/giancarlo/Dropbox/mariaT21/src/workspace && /home/giancarlo/Dropbox/mariaT21/build/catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/giancarlo/Dropbox/mariaT21/src/workspace/msg/WorkSpace.msg -Iworkspace:/home/giancarlo/Dropbox/mariaT21/src/workspace/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p workspace -o /home/giancarlo/Dropbox/mariaT21/devel/include/workspace -e /opt/ros/noetic/share/gencpp/cmake/..

workspace_generate_messages_cpp: workspace/CMakeFiles/workspace_generate_messages_cpp
workspace_generate_messages_cpp: /home/giancarlo/Dropbox/mariaT21/devel/include/workspace/WorkSpace.h
workspace_generate_messages_cpp: workspace/CMakeFiles/workspace_generate_messages_cpp.dir/build.make

.PHONY : workspace_generate_messages_cpp

# Rule to build all files generated by this target.
workspace/CMakeFiles/workspace_generate_messages_cpp.dir/build: workspace_generate_messages_cpp

.PHONY : workspace/CMakeFiles/workspace_generate_messages_cpp.dir/build

workspace/CMakeFiles/workspace_generate_messages_cpp.dir/clean:
	cd /home/giancarlo/Dropbox/mariaT21/build/workspace && $(CMAKE_COMMAND) -P CMakeFiles/workspace_generate_messages_cpp.dir/cmake_clean.cmake
.PHONY : workspace/CMakeFiles/workspace_generate_messages_cpp.dir/clean

workspace/CMakeFiles/workspace_generate_messages_cpp.dir/depend:
	cd /home/giancarlo/Dropbox/mariaT21/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/giancarlo/Dropbox/mariaT21/src /home/giancarlo/Dropbox/mariaT21/src/workspace /home/giancarlo/Dropbox/mariaT21/build /home/giancarlo/Dropbox/mariaT21/build/workspace /home/giancarlo/Dropbox/mariaT21/build/workspace/CMakeFiles/workspace_generate_messages_cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : workspace/CMakeFiles/workspace_generate_messages_cpp.dir/depend
