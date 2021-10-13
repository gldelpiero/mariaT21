; Auto-generated. Do not edit!


(cl:in-package child_detection-msg)


;//! \htmlinclude ChildDetection.msg.html

(cl:defclass <ChildDetection> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (detected
    :reader detected
    :initarg :detected
    :type cl:boolean
    :initform cl:nil)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (child_position
    :reader child_position
    :initarg :child_position
    :type general_functions-msg:Position
    :initform (cl:make-instance 'general_functions-msg:Position)))
)

(cl:defclass ChildDetection (<ChildDetection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChildDetection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChildDetection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name child_detection-msg:<ChildDetection> is deprecated: use child_detection-msg:ChildDetection instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ChildDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader child_detection-msg:header-val is deprecated.  Use child_detection-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'detected-val :lambda-list '(m))
(cl:defmethod detected-val ((m <ChildDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader child_detection-msg:detected-val is deprecated.  Use child_detection-msg:detected instead.")
  (detected m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <ChildDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader child_detection-msg:angle-val is deprecated.  Use child_detection-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <ChildDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader child_detection-msg:distance-val is deprecated.  Use child_detection-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'child_position-val :lambda-list '(m))
(cl:defmethod child_position-val ((m <ChildDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader child_detection-msg:child_position-val is deprecated.  Use child_detection-msg:child_position instead.")
  (child_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChildDetection>) ostream)
  "Serializes a message object of type '<ChildDetection>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'detected) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'child_position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChildDetection>) istream)
  "Deserializes a message object of type '<ChildDetection>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'detected) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'child_position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChildDetection>)))
  "Returns string type for a message object of type '<ChildDetection>"
  "child_detection/ChildDetection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChildDetection)))
  "Returns string type for a message object of type 'ChildDetection"
  "child_detection/ChildDetection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChildDetection>)))
  "Returns md5sum for a message object of type '<ChildDetection>"
  "5c7596216903a2154c277a5c52dc0801")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChildDetection)))
  "Returns md5sum for a message object of type 'ChildDetection"
  "5c7596216903a2154c277a5c52dc0801")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChildDetection>)))
  "Returns full string definition for message of type '<ChildDetection>"
  (cl:format cl:nil "Header header~%~%# Is there a child?~%bool detected~%~%# If there is a child, contains the angle between the sensor and the child~%# otherwise, contains 0~%# angle is in (-180, 180] degrees~%float64 angle~%~%# If there is a child, contains the distance between the sensor and the child [in meters]~%# otherwise, contains 0~%# distance is in meters~%float64 distance~%~%# If there is a child, contais the global position of the child~%# otherwise, contains (0, 0, 0)~%general_functions/Position  child_position~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: general_functions/Position~%float64 x~%float64 y~%float64 angle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChildDetection)))
  "Returns full string definition for message of type 'ChildDetection"
  (cl:format cl:nil "Header header~%~%# Is there a child?~%bool detected~%~%# If there is a child, contains the angle between the sensor and the child~%# otherwise, contains 0~%# angle is in (-180, 180] degrees~%float64 angle~%~%# If there is a child, contains the distance between the sensor and the child [in meters]~%# otherwise, contains 0~%# distance is in meters~%float64 distance~%~%# If there is a child, contais the global position of the child~%# otherwise, contains (0, 0, 0)~%general_functions/Position  child_position~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: general_functions/Position~%float64 x~%float64 y~%float64 angle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChildDetection>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'child_position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChildDetection>))
  "Converts a ROS message object to a list"
  (cl:list 'ChildDetection
    (cl:cons ':header (header msg))
    (cl:cons ':detected (detected msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':child_position (child_position msg))
))
