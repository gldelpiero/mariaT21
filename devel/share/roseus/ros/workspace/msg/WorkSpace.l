;; Auto-generated. Do not edit!


(when (boundp 'workspace::WorkSpace)
  (if (not (find-package "WORKSPACE"))
    (make-package "WORKSPACE"))
  (shadow 'WorkSpace (find-package "WORKSPACE")))
(unless (find-package "WORKSPACE::WORKSPACE")
  (make-package "WORKSPACE::WORKSPACE"))

(in-package "ROS")
;;//! \htmlinclude WorkSpace.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*CHILD_AREA_EXTERNAL*" (find-package "WORKSPACE::WORKSPACE"))
(shadow '*CHILD_AREA_EXTERNAL* (find-package "WORKSPACE::WORKSPACE"))
(defconstant workspace::WorkSpace::*CHILD_AREA_EXTERNAL* 0)
(intern "*CHILD_AREA_OBSERVATION*" (find-package "WORKSPACE::WORKSPACE"))
(shadow '*CHILD_AREA_OBSERVATION* (find-package "WORKSPACE::WORKSPACE"))
(defconstant workspace::WorkSpace::*CHILD_AREA_OBSERVATION* 1)
(intern "*CHILD_AREA_INTERACTION*" (find-package "WORKSPACE::WORKSPACE"))
(shadow '*CHILD_AREA_INTERACTION* (find-package "WORKSPACE::WORKSPACE"))
(defconstant workspace::WorkSpace::*CHILD_AREA_INTERACTION* 2)

(defun workspace::WorkSpace-to-symbol (const)
  (cond
        ((= const 0) 'workspace::WorkSpace::*CHILD_AREA_EXTERNAL*)
        ((= const 1) 'workspace::WorkSpace::*CHILD_AREA_OBSERVATION*)
        ((= const 2) 'workspace::WorkSpace::*CHILD_AREA_INTERACTION*)
        (t nil)))

(defclass workspace::WorkSpace
  :super ros::object
  :slots (_header _child_observation_distance _child_area _robot_bounds_proximity ))

(defmethod workspace::WorkSpace
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:child_observation_distance __child_observation_distance) 0.0)
    ((:child_area __child_area) 0)
    ((:robot_bounds_proximity __robot_bounds_proximity) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _child_observation_distance (float __child_observation_distance))
   (setq _child_area (round __child_area))
   (setq _robot_bounds_proximity (float __robot_bounds_proximity))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:child_observation_distance
   (&optional __child_observation_distance)
   (if __child_observation_distance (setq _child_observation_distance __child_observation_distance)) _child_observation_distance)
  (:child_area
   (&optional __child_area)
   (if __child_area (setq _child_area __child_area)) _child_area)
  (:robot_bounds_proximity
   (&optional __robot_bounds_proximity)
   (if __robot_bounds_proximity (setq _robot_bounds_proximity __robot_bounds_proximity)) _robot_bounds_proximity)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _child_observation_distance
    8
    ;; uint8 _child_area
    1
    ;; float64 _robot_bounds_proximity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _child_observation_distance
       (sys::poke _child_observation_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _child_area
       (write-byte _child_area s)
     ;; float64 _robot_bounds_proximity
       (sys::poke _robot_bounds_proximity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _child_observation_distance
     (setq _child_observation_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _child_area
     (setq _child_area (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _robot_bounds_proximity
     (setq _robot_bounds_proximity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get workspace::WorkSpace :md5sum-) "e89ba90aefce0514a1a6081c2178f0d2")
(setf (get workspace::WorkSpace :datatype-) "workspace/WorkSpace")
(setf (get workspace::WorkSpace :definition-)
      "uint8 CHILD_AREA_EXTERNAL = 0
uint8 CHILD_AREA_OBSERVATION = 1
uint8 CHILD_AREA_INTERACTION = 2

Header  header
float64 child_observation_distance
uint8   child_area
float64 robot_bounds_proximity

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :workspace/WorkSpace "e89ba90aefce0514a1a6081c2178f0d2")


