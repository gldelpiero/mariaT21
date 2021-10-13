; Auto-generated. Do not edit!


(cl:in-package state_machine-msg)


;//! \htmlinclude OnChange.msg.html

(cl:defclass <OnChange> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (last
    :reader last
    :initarg :last
    :type cl:fixnum
    :initform 0)
   (current
    :reader current
    :initarg :current
    :type cl:fixnum
    :initform 0))
)

(cl:defclass OnChange (<OnChange>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OnChange>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OnChange)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name state_machine-msg:<OnChange> is deprecated: use state_machine-msg:OnChange instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <OnChange>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_machine-msg:header-val is deprecated.  Use state_machine-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'last-val :lambda-list '(m))
(cl:defmethod last-val ((m <OnChange>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_machine-msg:last-val is deprecated.  Use state_machine-msg:last instead.")
  (last m))

(cl:ensure-generic-function 'current-val :lambda-list '(m))
(cl:defmethod current-val ((m <OnChange>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader state_machine-msg:current-val is deprecated.  Use state_machine-msg:current instead.")
  (current m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<OnChange>)))
    "Constants for message type '<OnChange>"
  '((:PUBLIC . 0)
    (:SOCIAL_PUBLIC . 1)
    (:SOCIAL . 2)
    (:PERSONAL_SOCIAL . 3)
    (:PERSONAL . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'OnChange)))
    "Constants for message type 'OnChange"
  '((:PUBLIC . 0)
    (:SOCIAL_PUBLIC . 1)
    (:SOCIAL . 2)
    (:PERSONAL_SOCIAL . 3)
    (:PERSONAL . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OnChange>) ostream)
  "Serializes a message object of type '<OnChange>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'last)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'current)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OnChange>) istream)
  "Deserializes a message object of type '<OnChange>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'last)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'current)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OnChange>)))
  "Returns string type for a message object of type '<OnChange>"
  "state_machine/OnChange")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OnChange)))
  "Returns string type for a message object of type 'OnChange"
  "state_machine/OnChange")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OnChange>)))
  "Returns md5sum for a message object of type '<OnChange>"
  "b753c12898c2836606104c967f05183f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OnChange)))
  "Returns md5sum for a message object of type 'OnChange"
  "b753c12898c2836606104c967f05183f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OnChange>)))
  "Returns full string definition for message of type '<OnChange>"
  (cl:format cl:nil "Header header~%~%uint8 PUBLIC = 0~%uint8 SOCIAL_PUBLIC = 1~%uint8 SOCIAL = 2~%uint8 PERSONAL_SOCIAL = 3~%uint8 PERSONAL = 4~%~%uint8 last~%uint8 current ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OnChange)))
  "Returns full string definition for message of type 'OnChange"
  (cl:format cl:nil "Header header~%~%uint8 PUBLIC = 0~%uint8 SOCIAL_PUBLIC = 1~%uint8 SOCIAL = 2~%uint8 PERSONAL_SOCIAL = 3~%uint8 PERSONAL = 4~%~%uint8 last~%uint8 current ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OnChange>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OnChange>))
  "Converts a ROS message object to a list"
  (cl:list 'OnChange
    (cl:cons ':header (header msg))
    (cl:cons ':last (last msg))
    (cl:cons ':current (current msg))
))
