; Auto-generated. Do not edit!


(cl:in-package operation_modes-msg)


;//! \htmlinclude OperationModes.msg.html

(cl:defclass <OperationModes> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (code
    :reader code
    :initarg :code
    :type cl:fixnum
    :initform 0))
)

(cl:defclass OperationModes (<OperationModes>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OperationModes>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OperationModes)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name operation_modes-msg:<OperationModes> is deprecated: use operation_modes-msg:OperationModes instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <OperationModes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader operation_modes-msg:header-val is deprecated.  Use operation_modes-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'code-val :lambda-list '(m))
(cl:defmethod code-val ((m <OperationModes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader operation_modes-msg:code-val is deprecated.  Use operation_modes-msg:code instead.")
  (code m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<OperationModes>)))
    "Constants for message type '<OperationModes>"
  '((:OPERATION_MODE_STOP . 0)
    (:OPERATION_MODE_PRESENT . 1)
    (:OPERATION_MODE_ROTATE_360 . 2)
    (:OPERATION_MODE_STAY_CLOSE . 3)
    (:OPERATION_MODE_STAY_AWAY . 4)
    (:OPERATION_MODE_FOLLOW . 5)
    (:OPERATION_MODE_GO_TO_ORIGIN . 9)
    (:OPERATION_MODE_RIGHT_HAND . 14)
    (:OPERATION_MODE_LEFT_HAND . 15)
    (:OPERATION_MODE_SAVE_LOG . 89))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'OperationModes)))
    "Constants for message type 'OperationModes"
  '((:OPERATION_MODE_STOP . 0)
    (:OPERATION_MODE_PRESENT . 1)
    (:OPERATION_MODE_ROTATE_360 . 2)
    (:OPERATION_MODE_STAY_CLOSE . 3)
    (:OPERATION_MODE_STAY_AWAY . 4)
    (:OPERATION_MODE_FOLLOW . 5)
    (:OPERATION_MODE_GO_TO_ORIGIN . 9)
    (:OPERATION_MODE_RIGHT_HAND . 14)
    (:OPERATION_MODE_LEFT_HAND . 15)
    (:OPERATION_MODE_SAVE_LOG . 89))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OperationModes>) ostream)
  "Serializes a message object of type '<OperationModes>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'code)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OperationModes>) istream)
  "Deserializes a message object of type '<OperationModes>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'code)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OperationModes>)))
  "Returns string type for a message object of type '<OperationModes>"
  "operation_modes/OperationModes")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OperationModes)))
  "Returns string type for a message object of type 'OperationModes"
  "operation_modes/OperationModes")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OperationModes>)))
  "Returns md5sum for a message object of type '<OperationModes>"
  "974ab5f9fea522ccc10c633de9ff6821")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OperationModes)))
  "Returns md5sum for a message object of type 'OperationModes"
  "974ab5f9fea522ccc10c633de9ff6821")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OperationModes>)))
  "Returns full string definition for message of type '<OperationModes>"
  (cl:format cl:nil "Header header~%~%uint8 OPERATION_MODE_STOP = 0~%uint8 OPERATION_MODE_PRESENT = 1~%uint8 OPERATION_MODE_ROTATE_360 = 2~%uint8 OPERATION_MODE_STAY_CLOSE = 3~%uint8 OPERATION_MODE_STAY_AWAY = 4~%uint8 OPERATION_MODE_FOLLOW = 5~%~%uint8 OPERATION_MODE_GO_TO_ORIGIN = 9~%~%uint8 OPERATION_MODE_RIGHT_HAND = 14~%uint8 OPERATION_MODE_LEFT_HAND = 15~%~%uint8 OPERATION_MODE_SAVE_LOG = 89~%~%uint8 code~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OperationModes)))
  "Returns full string definition for message of type 'OperationModes"
  (cl:format cl:nil "Header header~%~%uint8 OPERATION_MODE_STOP = 0~%uint8 OPERATION_MODE_PRESENT = 1~%uint8 OPERATION_MODE_ROTATE_360 = 2~%uint8 OPERATION_MODE_STAY_CLOSE = 3~%uint8 OPERATION_MODE_STAY_AWAY = 4~%uint8 OPERATION_MODE_FOLLOW = 5~%~%uint8 OPERATION_MODE_GO_TO_ORIGIN = 9~%~%uint8 OPERATION_MODE_RIGHT_HAND = 14~%uint8 OPERATION_MODE_LEFT_HAND = 15~%~%uint8 OPERATION_MODE_SAVE_LOG = 89~%~%uint8 code~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OperationModes>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OperationModes>))
  "Converts a ROS message object to a list"
  (cl:list 'OperationModes
    (cl:cons ':header (header msg))
    (cl:cons ':code (code msg))
))
