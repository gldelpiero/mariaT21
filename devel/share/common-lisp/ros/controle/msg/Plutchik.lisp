; Auto-generated. Do not edit!


(cl:in-package controle-msg)


;//! \htmlinclude Plutchik.msg.html

(cl:defclass <Plutchik> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (joy_sadness
    :reader joy_sadness
    :initarg :joy_sadness
    :type cl:fixnum
    :initform 0)
   (surprise_anticipation
    :reader surprise_anticipation
    :initarg :surprise_anticipation
    :type cl:fixnum
    :initform 0)
   (anger_fear
    :reader anger_fear
    :initarg :anger_fear
    :type cl:fixnum
    :initform 0)
   (trust_disgust
    :reader trust_disgust
    :initarg :trust_disgust
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Plutchik (<Plutchik>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Plutchik>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Plutchik)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name controle-msg:<Plutchik> is deprecated: use controle-msg:Plutchik instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Plutchik>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:header-val is deprecated.  Use controle-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'joy_sadness-val :lambda-list '(m))
(cl:defmethod joy_sadness-val ((m <Plutchik>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:joy_sadness-val is deprecated.  Use controle-msg:joy_sadness instead.")
  (joy_sadness m))

(cl:ensure-generic-function 'surprise_anticipation-val :lambda-list '(m))
(cl:defmethod surprise_anticipation-val ((m <Plutchik>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:surprise_anticipation-val is deprecated.  Use controle-msg:surprise_anticipation instead.")
  (surprise_anticipation m))

(cl:ensure-generic-function 'anger_fear-val :lambda-list '(m))
(cl:defmethod anger_fear-val ((m <Plutchik>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:anger_fear-val is deprecated.  Use controle-msg:anger_fear instead.")
  (anger_fear m))

(cl:ensure-generic-function 'trust_disgust-val :lambda-list '(m))
(cl:defmethod trust_disgust-val ((m <Plutchik>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:trust_disgust-val is deprecated.  Use controle-msg:trust_disgust instead.")
  (trust_disgust m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Plutchik>) ostream)
  "Serializes a message object of type '<Plutchik>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'joy_sadness)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'surprise_anticipation)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'anger_fear)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'trust_disgust)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Plutchik>) istream)
  "Deserializes a message object of type '<Plutchik>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'joy_sadness) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'surprise_anticipation) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'anger_fear) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trust_disgust) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Plutchik>)))
  "Returns string type for a message object of type '<Plutchik>"
  "controle/Plutchik")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Plutchik)))
  "Returns string type for a message object of type 'Plutchik"
  "controle/Plutchik")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Plutchik>)))
  "Returns md5sum for a message object of type '<Plutchik>"
  "3de017963cf6b074941410adf7783cb7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Plutchik)))
  "Returns md5sum for a message object of type 'Plutchik"
  "3de017963cf6b074941410adf7783cb7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Plutchik>)))
  "Returns full string definition for message of type '<Plutchik>"
  (cl:format cl:nil "Header header~%int8 joy_sadness~%int8 surprise_anticipation~%int8 anger_fear~%int8 trust_disgust~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Plutchik)))
  "Returns full string definition for message of type 'Plutchik"
  (cl:format cl:nil "Header header~%int8 joy_sadness~%int8 surprise_anticipation~%int8 anger_fear~%int8 trust_disgust~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Plutchik>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Plutchik>))
  "Converts a ROS message object to a list"
  (cl:list 'Plutchik
    (cl:cons ':header (header msg))
    (cl:cons ':joy_sadness (joy_sadness msg))
    (cl:cons ':surprise_anticipation (surprise_anticipation msg))
    (cl:cons ':anger_fear (anger_fear msg))
    (cl:cons ':trust_disgust (trust_disgust msg))
))
