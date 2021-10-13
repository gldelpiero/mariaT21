; Auto-generated. Do not edit!


(cl:in-package controle-msg)


;//! \htmlinclude Data.msg.html

(cl:defclass <Data> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (distance
    :reader distance
    :initarg :distance
    :type controle-msg:Distance
    :initform (cl:make-instance 'controle-msg:Distance))
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (proxemic_zone
    :reader proxemic_zone
    :initarg :proxemic_zone
    :type cl:fixnum
    :initform 0)
   (workspace_area
    :reader workspace_area
    :initarg :workspace_area
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Data (<Data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name controle-msg:<Data> is deprecated: use controle-msg:Data instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:header-val is deprecated.  Use controle-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:distance-val is deprecated.  Use controle-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:angle-val is deprecated.  Use controle-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'proxemic_zone-val :lambda-list '(m))
(cl:defmethod proxemic_zone-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:proxemic_zone-val is deprecated.  Use controle-msg:proxemic_zone instead.")
  (proxemic_zone m))

(cl:ensure-generic-function 'workspace_area-val :lambda-list '(m))
(cl:defmethod workspace_area-val ((m <Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:workspace_area-val is deprecated.  Use controle-msg:workspace_area instead.")
  (workspace_area m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Data>)))
    "Constants for message type '<Data>"
  '((:PROXEMIC_ZONE_PUBLIC . 0)
    (:PROXEMIC_ZONE_SOCIAL_PUBLIC . 1)
    (:PROXEMIC_ZONE_SOCIAL . 2)
    (:PROXEMIC_ZONE_PERSONAL_SOCIAL . 3)
    (:PROXEMIC_ZONE_PERSONAL . 4)
    (:WORKSPACE_AREA_EXTERNAL . 0)
    (:WORKSPACE_AREA_OBSERVATION . 1)
    (:WORKSPACE_AREA_INTERACTION . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Data)))
    "Constants for message type 'Data"
  '((:PROXEMIC_ZONE_PUBLIC . 0)
    (:PROXEMIC_ZONE_SOCIAL_PUBLIC . 1)
    (:PROXEMIC_ZONE_SOCIAL . 2)
    (:PROXEMIC_ZONE_PERSONAL_SOCIAL . 3)
    (:PROXEMIC_ZONE_PERSONAL . 4)
    (:WORKSPACE_AREA_EXTERNAL . 0)
    (:WORKSPACE_AREA_OBSERVATION . 1)
    (:WORKSPACE_AREA_INTERACTION . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Data>) ostream)
  "Serializes a message object of type '<Data>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'distance) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'proxemic_zone)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'workspace_area)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Data>) istream)
  "Deserializes a message object of type '<Data>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'distance) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'proxemic_zone)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'workspace_area)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Data>)))
  "Returns string type for a message object of type '<Data>"
  "controle/Data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Data)))
  "Returns string type for a message object of type 'Data"
  "controle/Data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Data>)))
  "Returns md5sum for a message object of type '<Data>"
  "8e71096c455d398c228a2768f716cf97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Data)))
  "Returns md5sum for a message object of type 'Data"
  "8e71096c455d398c228a2768f716cf97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Data>)))
  "Returns full string definition for message of type '<Data>"
  (cl:format cl:nil "Header header~%controle/Distance distance~%float32 angle~%uint8 PROXEMIC_ZONE_PUBLIC = 0~%uint8 PROXEMIC_ZONE_SOCIAL_PUBLIC = 1~%uint8 PROXEMIC_ZONE_SOCIAL = 2~%uint8 PROXEMIC_ZONE_PERSONAL_SOCIAL = 3~%uint8 PROXEMIC_ZONE_PERSONAL = 4~%uint8 proxemic_zone~%uint8 WORKSPACE_AREA_EXTERNAL = 0~%uint8 WORKSPACE_AREA_OBSERVATION = 1~%uint8 WORKSPACE_AREA_INTERACTION = 2~%uint8 workspace_area~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: controle/Distance~%float32 desired~%float32 observation~%float32 current~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Data)))
  "Returns full string definition for message of type 'Data"
  (cl:format cl:nil "Header header~%controle/Distance distance~%float32 angle~%uint8 PROXEMIC_ZONE_PUBLIC = 0~%uint8 PROXEMIC_ZONE_SOCIAL_PUBLIC = 1~%uint8 PROXEMIC_ZONE_SOCIAL = 2~%uint8 PROXEMIC_ZONE_PERSONAL_SOCIAL = 3~%uint8 PROXEMIC_ZONE_PERSONAL = 4~%uint8 proxemic_zone~%uint8 WORKSPACE_AREA_EXTERNAL = 0~%uint8 WORKSPACE_AREA_OBSERVATION = 1~%uint8 WORKSPACE_AREA_INTERACTION = 2~%uint8 workspace_area~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: controle/Distance~%float32 desired~%float32 observation~%float32 current~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Data>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'distance))
     4
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Data>))
  "Converts a ROS message object to a list"
  (cl:list 'Data
    (cl:cons ':header (header msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':proxemic_zone (proxemic_zone msg))
    (cl:cons ':workspace_area (workspace_area msg))
))
