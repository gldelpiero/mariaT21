; Auto-generated. Do not edit!


(cl:in-package controle-srv)


;//! \htmlinclude ChangeMode-request.msg.html

(cl:defclass <ChangeMode-request> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ChangeMode-request (<ChangeMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name controle-srv:<ChangeMode-request> is deprecated: use controle-srv:ChangeMode-request instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <ChangeMode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-srv:mode-val is deprecated.  Use controle-srv:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeMode-request>) ostream)
  "Serializes a message object of type '<ChangeMode-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeMode-request>) istream)
  "Deserializes a message object of type '<ChangeMode-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeMode-request>)))
  "Returns string type for a service object of type '<ChangeMode-request>"
  "controle/ChangeModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeMode-request)))
  "Returns string type for a service object of type 'ChangeMode-request"
  "controle/ChangeModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeMode-request>)))
  "Returns md5sum for a message object of type '<ChangeMode-request>"
  "6355e26f776c047b791d9822fff786f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeMode-request)))
  "Returns md5sum for a message object of type 'ChangeMode-request"
  "6355e26f776c047b791d9822fff786f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeMode-request>)))
  "Returns full string definition for message of type '<ChangeMode-request>"
  (cl:format cl:nil "uint8 mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeMode-request)))
  "Returns full string definition for message of type 'ChangeMode-request"
  (cl:format cl:nil "uint8 mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeMode-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeMode-request
    (cl:cons ':mode (mode msg))
))
;//! \htmlinclude ChangeMode-response.msg.html

(cl:defclass <ChangeMode-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ChangeMode-response (<ChangeMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name controle-srv:<ChangeMode-response> is deprecated: use controle-srv:ChangeMode-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <ChangeMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controle-srv:status-val is deprecated.  Use controle-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeMode-response>) ostream)
  "Serializes a message object of type '<ChangeMode-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeMode-response>) istream)
  "Deserializes a message object of type '<ChangeMode-response>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeMode-response>)))
  "Returns string type for a service object of type '<ChangeMode-response>"
  "controle/ChangeModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeMode-response)))
  "Returns string type for a service object of type 'ChangeMode-response"
  "controle/ChangeModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeMode-response>)))
  "Returns md5sum for a message object of type '<ChangeMode-response>"
  "6355e26f776c047b791d9822fff786f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeMode-response)))
  "Returns md5sum for a message object of type 'ChangeMode-response"
  "6355e26f776c047b791d9822fff786f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeMode-response>)))
  "Returns full string definition for message of type '<ChangeMode-response>"
  (cl:format cl:nil "bool status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeMode-response)))
  "Returns full string definition for message of type 'ChangeMode-response"
  (cl:format cl:nil "bool status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeMode-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeMode-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChangeMode)))
  'ChangeMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChangeMode)))
  'ChangeMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeMode)))
  "Returns string type for a service object of type '<ChangeMode>"
  "controle/ChangeMode")