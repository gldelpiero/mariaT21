; Auto-generated. Do not edit!


(cl:in-package controle-msg)


;//! \htmlinclude Emotion.msg.html

(cl:defclass <Emotion> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (code
    :reader code
    :initarg :code
    :type cl:fixnum
    :initform 0)
   (percentage
    :reader percentage
    :initarg :percentage
    :type cl:fixnum
    :initform 0)
   (pleasure
    :reader pleasure
    :initarg :pleasure
    :type cl:fixnum
    :initform 0)
   (arousal
    :reader arousal
    :initarg :arousal
    :type cl:fixnum
    :initform 0)
   (dominance
    :reader dominance
    :initarg :dominance
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Emotion (<Emotion>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Emotion>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Emotion)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name controle-msg:<Emotion> is deprecated: use controle-msg:Emotion instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:header-val is deprecated.  Use controle-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'code-val :lambda-list '(m))
(cl:defmethod code-val ((m <Emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:code-val is deprecated.  Use controle-msg:code instead.")
  (code m))

(cl:ensure-generic-function 'percentage-val :lambda-list '(m))
(cl:defmethod percentage-val ((m <Emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:percentage-val is deprecated.  Use controle-msg:percentage instead.")
  (percentage m))

(cl:ensure-generic-function 'pleasure-val :lambda-list '(m))
(cl:defmethod pleasure-val ((m <Emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:pleasure-val is deprecated.  Use controle-msg:pleasure instead.")
  (pleasure m))

(cl:ensure-generic-function 'arousal-val :lambda-list '(m))
(cl:defmethod arousal-val ((m <Emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:arousal-val is deprecated.  Use controle-msg:arousal instead.")
  (arousal m))

(cl:ensure-generic-function 'dominance-val :lambda-list '(m))
(cl:defmethod dominance-val ((m <Emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-msg:dominance-val is deprecated.  Use controle-msg:dominance instead.")
  (dominance m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Emotion>)))
    "Constants for message type '<Emotion>"
  '((:EMOTION_ANGER . 0)
    (:EMOTION_DISGUST . 1)
    (:EMOTION_FEAR . 2)
    (:EMOTION_HAPPINESS . 3)
    (:EMOTION_SADNESS . 4)
    (:EMOTION_SUSPRISE . 5)
    (:EMOTION_TRUST . 6)
    (:EMOTION_ANTICIPATION . 7))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Emotion)))
    "Constants for message type 'Emotion"
  '((:EMOTION_ANGER . 0)
    (:EMOTION_DISGUST . 1)
    (:EMOTION_FEAR . 2)
    (:EMOTION_HAPPINESS . 3)
    (:EMOTION_SADNESS . 4)
    (:EMOTION_SUSPRISE . 5)
    (:EMOTION_TRUST . 6)
    (:EMOTION_ANTICIPATION . 7))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Emotion>) ostream)
  "Serializes a message object of type '<Emotion>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'percentage)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'pleasure)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'arousal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dominance)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Emotion>) istream)
  "Deserializes a message object of type '<Emotion>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'percentage)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pleasure) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'arousal) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dominance) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Emotion>)))
  "Returns string type for a message object of type '<Emotion>"
  "controle/Emotion")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Emotion)))
  "Returns string type for a message object of type 'Emotion"
  "controle/Emotion")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Emotion>)))
  "Returns md5sum for a message object of type '<Emotion>"
  "6710c8ff5d9ca3e0bda8d2c2af186861")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Emotion)))
  "Returns md5sum for a message object of type 'Emotion"
  "6710c8ff5d9ca3e0bda8d2c2af186861")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Emotion>)))
  "Returns full string definition for message of type '<Emotion>"
  (cl:format cl:nil "Header header~%uint8 EMOTION_ANGER = 0~%uint8 EMOTION_DISGUST = 1~%uint8 EMOTION_FEAR = 2~%uint8 EMOTION_HAPPINESS = 3~%uint8 EMOTION_SADNESS = 4~%uint8 EMOTION_SUSPRISE = 5~%uint8 EMOTION_TRUST = 6~%uint8 EMOTION_ANTICIPATION = 7~%uint8 code~%uint8 percentage~%~%int8 pleasure~%int8 arousal~%int8 dominance~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Emotion)))
  "Returns full string definition for message of type 'Emotion"
  (cl:format cl:nil "Header header~%uint8 EMOTION_ANGER = 0~%uint8 EMOTION_DISGUST = 1~%uint8 EMOTION_FEAR = 2~%uint8 EMOTION_HAPPINESS = 3~%uint8 EMOTION_SADNESS = 4~%uint8 EMOTION_SUSPRISE = 5~%uint8 EMOTION_TRUST = 6~%uint8 EMOTION_ANTICIPATION = 7~%uint8 code~%uint8 percentage~%~%int8 pleasure~%int8 arousal~%int8 dominance~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Emotion>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Emotion>))
  "Converts a ROS message object to a list"
  (cl:list 'Emotion
    (cl:cons ':header (header msg))
    (cl:cons ':code (code msg))
    (cl:cons ':percentage (percentage msg))
    (cl:cons ':pleasure (pleasure msg))
    (cl:cons ':arousal (arousal msg))
    (cl:cons ':dominance (dominance msg))
))
