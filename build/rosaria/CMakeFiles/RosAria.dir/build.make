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

# Include any dependencies generated for this target.
include rosaria/CMakeFiles/RosAria.dir/depend.make

# Include the progress variables for this target.
include rosaria/CMakeFiles/RosAria.dir/progress.make

# Include the compile flags for this target's objects.
include rosaria/CMakeFiles/RosAria.dir/flags.make

rosaria/CMakeFiles/RosAria.dir/RosAria.cpp.o: rosaria/CMakeFiles/RosAria.dir/flags.make
rosaria/CMakeFiles/RosAria.dir/RosAria.cpp.o: /home/giancarlo/Dropbox/mariaT21/src/rosaria/RosAria.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giancarlo/Dropbox/mariaT21/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object rosaria/CMakeFiles/RosAria.dir/RosAria.cpp.o"
	cd /home/giancarlo/Dropbox/mariaT21/build/rosaria && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/RosAria.dir/RosAria.cpp.o -c /home/giancarlo/Dropbox/mariaT21/src/rosaria/RosAria.cpp

rosaria/CMakeFiles/RosAria.dir/RosAria.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RosAria.dir/RosAria.cpp.i"
	cd /home/giancarlo/Dropbox/mariaT21/build/rosaria && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/giancarlo/Dropbox/mariaT21/src/rosaria/RosAria.cpp > CMakeFiles/RosAria.dir/RosAria.cpp.i

rosaria/CMakeFiles/RosAria.dir/RosAria.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RosAria.dir/RosAria.cpp.s"
	cd /home/giancarlo/Dropbox/mariaT21/build/rosaria && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/giancarlo/Dropbox/mariaT21/src/rosaria/RosAria.cpp -o CMakeFiles/RosAria.dir/RosAria.cpp.s

rosaria/CMakeFiles/RosAria.dir/LaserPublisher.cpp.o: rosaria/CMakeFiles/RosAria.dir/flags.make
rosaria/CMakeFiles/RosAria.dir/LaserPublisher.cpp.o: /home/giancarlo/Dropbox/mariaT21/src/rosaria/LaserPublisher.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/giancarlo/Dropbox/mariaT21/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object rosaria/CMakeFiles/RosAria.dir/LaserPublisher.cpp.o"
	cd /home/giancarlo/Dropbox/mariaT21/build/rosaria && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/RosAria.dir/LaserPublisher.cpp.o -c /home/giancarlo/Dropbox/mariaT21/src/rosaria/LaserPublisher.cpp

rosaria/CMakeFiles/RosAria.dir/LaserPublisher.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/RosAria.dir/LaserPublisher.cpp.i"
	cd /home/giancarlo/Dropbox/mariaT21/build/rosaria && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/giancarlo/Dropbox/mariaT21/src/rosaria/LaserPublisher.cpp > CMakeFiles/RosAria.dir/LaserPublisher.cpp.i

rosaria/CMakeFiles/RosAria.dir/LaserPublisher.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/RosAria.dir/LaserPublisher.cpp.s"
	cd /home/giancarlo/Dropbox/mariaT21/build/rosaria && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/giancarlo/Dropbox/mariaT21/src/rosaria/LaserPublisher.cpp -o CMakeFiles/RosAria.dir/LaserPublisher.cpp.s

# Object files for target RosAria
RosAria_OBJECTS = \
"CMakeFiles/RosAria.dir/RosAria.cpp.o" \
"CMakeFiles/RosAria.dir/LaserPublisher.cpp.o"

# External object files for target RosAria
RosAria_EXTERNAL_OBJECTS =

/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: rosaria/CMakeFiles/RosAria.dir/RosAria.cpp.o
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: rosaria/CMakeFiles/RosAria.dir/LaserPublisher.cpp.o
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: rosaria/CMakeFiles/RosAria.dir/build.make
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/libtf.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/libtf2_ros.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/libactionlib.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/libmessage_filters.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/libroscpp.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/libtf2.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/librosconsole.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/libdynamic_reconfigure_config_init_mutex.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/librostime.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /opt/ros/noetic/lib/libcpp_common.so
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: /usr/lib/x86_64-linux-gnu/libboost_atomic.so.1.71.0
/home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria: rosaria/CMakeFiles/RosAria.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/giancarlo/Dropbox/mariaT21/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable /home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria"
	cd /home/giancarlo/Dropbox/mariaT21/build/rosaria && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/RosAria.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
rosaria/CMakeFiles/RosAria.dir/build: /home/giancarlo/Dropbox/mariaT21/devel/lib/rosaria/RosAria

.PHONY : rosaria/CMakeFiles/RosAria.dir/build

rosaria/CMakeFiles/RosAria.dir/clean:
	cd /home/giancarlo/Dropbox/mariaT21/build/rosaria && $(CMAKE_COMMAND) -P CMakeFiles/RosAria.dir/cmake_clean.cmake
.PHONY : rosaria/CMakeFiles/RosAria.dir/clean

rosaria/CMakeFiles/RosAria.dir/depend:
	cd /home/giancarlo/Dropbox/mariaT21/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/giancarlo/Dropbox/mariaT21/src /home/giancarlo/Dropbox/mariaT21/src/rosaria /home/giancarlo/Dropbox/mariaT21/build /home/giancarlo/Dropbox/mariaT21/build/rosaria /home/giancarlo/Dropbox/mariaT21/build/rosaria/CMakeFiles/RosAria.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : rosaria/CMakeFiles/RosAria.dir/depend

