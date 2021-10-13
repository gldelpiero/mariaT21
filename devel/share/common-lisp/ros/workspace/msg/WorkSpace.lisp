; Auto-generated. Do not edit!


(cl:in-package workspace-msg)


;//! \htmlinclude WorkSpace.msg.html

(cl:defclass <WorkSpace> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (child_observation_distance
    :reader child_observation_distance
    :initarg :child_observation_distance
    :type cl:float
    :initform 0.0)
   (child_area
    :reader child_area
    :initarg :child_area
    :type cl:fixnum
    :initform 0)
   (robot_bounds_proximity
    :reader robot_bounds_proximity
    :initarg :robot_bounds_proximity
    :type cl:float
    :initform 0.0))
)

(cl:defclass WorkSpace (<WorkSpace>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WorkSpace>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WorkSpace)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name workspace-msg:<WorkSpace> is deprecated: use workspace-msg:WorkSpace instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <WorkSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader workspace-msg:header-val is deprecated.  Use workspace-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'child_observation_distance-val :lambda-list '(m))
(cl:defmethod child_observation_distance-val ((m <WorkSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader workspace-msg:child_observation_distance-val is deprecated.  Use workspace-msg:child_observation_distance instead.")
  (child_observation_distance m))

(cl:ensure-generic-function 'child_area-val :lambda-list '(m))
(cl:defmethod child_area-val ((m <WorkSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader workspace-msg:child_area-val is deprecated.  Use workspace-msg:child_area instead.")
  (child_area m))

(cl:ensure-generic-function 'robot_bounds_proximity-val :lambda-list '(m))
(cl:defmethod robot_bounds_proximity-val ((m <WorkSpace>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader workspace-msg:robot_bounds_proximity-val is deprecated.  Use workspace-msg:robot_bounds_proximity instead.")
  (robot_bounds_proximity m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<WorkSpace>)))
    "Constants for message type '<WorkSpace>"
  '((:CHILD_AREA_EXTERNAL . 0)
    (:CHILD_AREA_OBSERVATION . 1)
    (:CHILD_AREA_INTERACTION . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'WorkSpace)))
    "Constants for message type 'WorkSpace"
  '((:CHILD_AREA_EXTERNAL . 0)
    (:CHILD_AREA_OBSERVATION . 1)
    (:CHILD_AREA_INTERACTION . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WorkSpace>) ostream)
  "Serializes a message object of type '<WorkSpace>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'child_observation_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'child_area)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'robot_bounds_proximity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WorkSpace>) istream)
  "Deserializes a message object of type '<WorkSpace>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'child_observation_distance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'child_area)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'robot_bounds_proximity) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WorkSpace>)))
  "Returns string type for a message object of type '<WorkSpace>"
  "workspace/WorkSpace")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WorkSpace)))
  "Returns string type for a message object of type 'WorkSpace"
  "workspace/WorkSpace")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WorkSpace>)))
  "Returns md5sum for a message object of type '<WorkSpace>"
  "e89ba90aefce0514a1a6081c2178f0d2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WorkSpace)))
  "Returns md5sum for a message object of type 'WorkSpace"
  "e89ba90aefce0514a1a6081c2178f0d2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WorkSpace>)))
  "Returns full string definition for message of type '<WorkSpace>"
  (cl:format cl:nil "uint8 CHILD_AREA_EXTERNAL = 0~%uint8 CHILD_AREA_OBSERVATION = 1~%uint8 CHILD_AREA_INTERACTION = 2~%~%Header  header~%float64 child_observation_distance~%uint8   child_area~%float64 robot_bounds_proximity~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WorkSpace)))
  "Returns full string definition for message of type 'WorkSpace"
  (cl:format cl:nil "uint8 CHILD_AREA_EXTERNAL = 0~%uint8 CHILD_AREA_OBSERVATION = 1~%uint8 CHILD_AREA_INTERACTION = 2~%~%Header  header~%float64 child_observation_distance~%uint8   child_area~%float64 robot_bounds_proximity~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WorkSpace>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WorkSpace>))
  "Converts a ROS message object to a list"
  (cl:list 'WorkSpace
    (cl:cons ':header (header msg))
    (cl:cons ':child_observation_distance (child_observation_distance msg))
    (cl:cons ':child_area (child_area msg))
    (cl:cons ':robot_bounds_proximity (robot_bounds_proximity msg))
))
