; Auto-generated. Do not edit!


(cl:in-package state_machine-msg)


;//! \htmlinclude DesiredDistance.msg.html

(cl:defclass <DesiredDistance> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (desired_distance
    :reader desired_distance
    :initarg :desired_distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass DesiredDistance (<DesiredDistance>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DesiredDistance>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DesiredDistance)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name state_machine-msg:<DesiredDistance> is deprecated: use state_machine-msg:DesiredDistance instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DesiredDistance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_machine-msg:header-val is deprecated.  Use state_machine-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'desired_distance-val :lambda-list '(m))
(cl:defmethod desired_distance-val ((m <DesiredDistance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_machine-msg:desired_distance-val is deprecated.  Use state_machine-msg:desired_distance instead.")
  (desired_distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DesiredDistance>) ostream)
  "Serializes a message object of type '<DesiredDistance>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'desired_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DesiredDistance>) istream)
  "Deserializes a message object of type '<DesiredDistance>"
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
    (cl:setf (cl:slot-value msg 'desired_distance) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DesiredDistance>)))
  "Returns string type for a message object of type '<DesiredDistance>"
  "state_machine/DesiredDistance")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DesiredDistance)))
  "Returns string type for a message object of type 'DesiredDistance"
  "state_machine/DesiredDistance")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DesiredDistance>)))
  "Returns md5sum for a message object of type '<DesiredDistance>"
  "5094fd976ee33ff6551fcacedcbae61f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DesiredDistance)))
  "Returns md5sum for a message object of type 'DesiredDistance"
  "5094fd976ee33ff6551fcacedcbae61f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DesiredDistance>)))
  "Returns full string definition for message of type '<DesiredDistance>"
  (cl:format cl:nil "Header header~%float64 desired_distance~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DesiredDistance)))
  "Returns full string definition for message of type 'DesiredDistance"
  (cl:format cl:nil "Header header~%float64 desired_distance~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DesiredDistance>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DesiredDistance>))
  "Converts a ROS message object to a list"
  (cl:list 'DesiredDistance
    (cl:cons ':header (header msg))
    (cl:cons ':desired_distance (desired_distance msg))
))
