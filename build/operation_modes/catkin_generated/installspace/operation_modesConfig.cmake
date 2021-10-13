# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(operation_modes_CONFIG_INCLUDED)
  return()
endif()
set(operation_modes_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(operation_modes_SOURCE_PREFIX /home/giancarlo/Dropbox/mariaT21/src/operation_modes)
  set(operation_modes_DEVEL_PREFIX /home/giancarlo/Dropbox/mariaT21/devel)
  set(operation_modes_INSTALL_PREFIX "")
  set(operation_modes_PREFIX ${operation_modes_DEVEL_PREFIX})
else()
  set(operation_modes_SOURCE_PREFIX "")
  set(operation_modes_DEVEL_PREFIX "")
  set(operation_modes_INSTALL_PREFIX /home/giancarlo/Dropbox/mariaT21/install)
  set(operation_modes_PREFIX ${operation_modes_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'operation_modes' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(operation_modes_FOUND_CATKIN_PROJECT TRUE)

if(NOT "include " STREQUAL " ")
  set(operation_modes_INCLUDE_DIRS "")
  set(_include_dirs "include")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT " " STREQUAL " ")
    set(_report "Check the website '' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'giancarlo <giancarlo@todo.todo>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${operation_modes_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'operation_modes' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'operation_modes' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '\${prefix}/${idir}'.  ${_report}")
    endif()
    _list_append_unique(operation_modes_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND operation_modes_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND operation_modes_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT operation_modes_NUM_DUMMY_TARGETS)
      set(operation_modes_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::operation_modes::wrapped-linker-option${operation_modes_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR operation_modes_NUM_DUMMY_TARGETS "${operation_modes_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::operation_modes::wrapped-linker-option${operation_modes_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND operation_modes_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND operation_modes_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND operation_modes_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/giancarlo/Dropbox/mariaT21/install/lib;/home/giancarlo/Dropbox/mariaT21/devel/lib;/opt/ros/noetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(operation_modes_LIBRARY_DIRS ${lib_path})
      list(APPEND operation_modes_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'operation_modes'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND operation_modes_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(operation_modes_EXPORTED_TARGETS "operation_modes_generate_messages_cpp;operation_modes_generate_messages_eus;operation_modes_generate_messages_lisp;operation_modes_generate_messages_nodejs;operation_modes_generate_messages_py")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${operation_modes_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "roscpp;std_msgs;message_runtime")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 operation_modes_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${operation_modes_dep}_FOUND)
      find_package(${operation_modes_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${operation_modes_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(operation_modes_INCLUDE_DIRS ${${operation_modes_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(operation_modes_LIBRARIES ${operation_modes_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${operation_modes_dep}_LIBRARIES})
  _list_append_deduplicate(operation_modes_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(operation_modes_LIBRARIES ${operation_modes_LIBRARIES})

  _list_append_unique(operation_modes_LIBRARY_DIRS ${${operation_modes_dep}_LIBRARY_DIRS})
  _list_append_deduplicate(operation_modes_EXPORTED_TARGETS ${${operation_modes_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "operation_modes-msg-extras.cmake")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${operation_modes_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
