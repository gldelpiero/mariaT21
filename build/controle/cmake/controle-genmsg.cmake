# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "controle: 4 messages, 1 services")

set(MSG_I_FLAGS "-Icontrole:/home/giancarlo/Dropbox/mariaT21/src/controle/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(controle_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg" NAME_WE)
add_custom_target(_controle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "controle" "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg" NAME_WE)
add_custom_target(_controle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "controle" "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg" ""
)

get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg" NAME_WE)
add_custom_target(_controle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "controle" "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg" "controle/Distance:std_msgs/Header"
)

get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg" NAME_WE)
add_custom_target(_controle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "controle" "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv" NAME_WE)
add_custom_target(_controle_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "controle" "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/controle
)
_generate_msg_cpp(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/controle
)
_generate_msg_cpp(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg"
  "${MSG_I_FLAGS}"
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/controle
)
_generate_msg_cpp(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/controle
)

### Generating Services
_generate_srv_cpp(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/controle
)

### Generating Module File
_generate_module_cpp(controle
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/controle
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(controle_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(controle_generate_messages controle_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg" NAME_WE)
add_dependencies(controle_generate_messages_cpp _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg" NAME_WE)
add_dependencies(controle_generate_messages_cpp _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg" NAME_WE)
add_dependencies(controle_generate_messages_cpp _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg" NAME_WE)
add_dependencies(controle_generate_messages_cpp _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv" NAME_WE)
add_dependencies(controle_generate_messages_cpp _controle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(controle_gencpp)
add_dependencies(controle_gencpp controle_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS controle_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/controle
)
_generate_msg_eus(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/controle
)
_generate_msg_eus(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg"
  "${MSG_I_FLAGS}"
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/controle
)
_generate_msg_eus(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/controle
)

### Generating Services
_generate_srv_eus(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/controle
)

### Generating Module File
_generate_module_eus(controle
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/controle
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(controle_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(controle_generate_messages controle_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg" NAME_WE)
add_dependencies(controle_generate_messages_eus _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg" NAME_WE)
add_dependencies(controle_generate_messages_eus _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg" NAME_WE)
add_dependencies(controle_generate_messages_eus _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg" NAME_WE)
add_dependencies(controle_generate_messages_eus _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv" NAME_WE)
add_dependencies(controle_generate_messages_eus _controle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(controle_geneus)
add_dependencies(controle_geneus controle_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS controle_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/controle
)
_generate_msg_lisp(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/controle
)
_generate_msg_lisp(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg"
  "${MSG_I_FLAGS}"
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/controle
)
_generate_msg_lisp(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/controle
)

### Generating Services
_generate_srv_lisp(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/controle
)

### Generating Module File
_generate_module_lisp(controle
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/controle
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(controle_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(controle_generate_messages controle_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg" NAME_WE)
add_dependencies(controle_generate_messages_lisp _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg" NAME_WE)
add_dependencies(controle_generate_messages_lisp _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg" NAME_WE)
add_dependencies(controle_generate_messages_lisp _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg" NAME_WE)
add_dependencies(controle_generate_messages_lisp _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv" NAME_WE)
add_dependencies(controle_generate_messages_lisp _controle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(controle_genlisp)
add_dependencies(controle_genlisp controle_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS controle_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/controle
)
_generate_msg_nodejs(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/controle
)
_generate_msg_nodejs(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg"
  "${MSG_I_FLAGS}"
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/controle
)
_generate_msg_nodejs(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/controle
)

### Generating Services
_generate_srv_nodejs(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/controle
)

### Generating Module File
_generate_module_nodejs(controle
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/controle
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(controle_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(controle_generate_messages controle_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg" NAME_WE)
add_dependencies(controle_generate_messages_nodejs _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg" NAME_WE)
add_dependencies(controle_generate_messages_nodejs _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg" NAME_WE)
add_dependencies(controle_generate_messages_nodejs _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg" NAME_WE)
add_dependencies(controle_generate_messages_nodejs _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv" NAME_WE)
add_dependencies(controle_generate_messages_nodejs _controle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(controle_gennodejs)
add_dependencies(controle_gennodejs controle_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS controle_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/controle
)
_generate_msg_py(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/controle
)
_generate_msg_py(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg"
  "${MSG_I_FLAGS}"
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/controle
)
_generate_msg_py(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/controle
)

### Generating Services
_generate_srv_py(controle
  "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/controle
)

### Generating Module File
_generate_module_py(controle
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/controle
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(controle_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(controle_generate_messages controle_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Emotion.msg" NAME_WE)
add_dependencies(controle_generate_messages_py _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Distance.msg" NAME_WE)
add_dependencies(controle_generate_messages_py _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Data.msg" NAME_WE)
add_dependencies(controle_generate_messages_py _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/msg/Plutchik.msg" NAME_WE)
add_dependencies(controle_generate_messages_py _controle_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/giancarlo/Dropbox/mariaT21/src/controle/srv/ChangeMode.srv" NAME_WE)
add_dependencies(controle_generate_messages_py _controle_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(controle_genpy)
add_dependencies(controle_genpy controle_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS controle_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/controle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/controle
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(controle_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/controle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/controle
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(controle_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/controle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/controle
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(controle_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/controle)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/controle
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(controle_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/controle)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/controle\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/controle
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(controle_generate_messages_py std_msgs_generate_messages_py)
endif()
