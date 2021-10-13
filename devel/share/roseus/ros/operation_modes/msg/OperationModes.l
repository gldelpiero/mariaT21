;; Auto-generated. Do not edit!


(when (boundp 'operation_modes::OperationModes)
  (if (not (find-package "OPERATION_MODES"))
    (make-package "OPERATION_MODES"))
  (shadow 'OperationModes (find-package "OPERATION_MODES")))
(unless (find-package "OPERATION_MODES::OPERATIONMODES")
  (make-package "OPERATION_MODES::OPERATIONMODES"))

(in-package "ROS")
;;//! \htmlinclude OperationModes.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*OPERATION_MODE_STOP*" (find-package "OPERATION_MODES::OPERATIONMODES"))
(shadow '*OPERATION_MODE_STOP* (find-package "OPERATION_MODES::OPERATIONMODES"))
(defconstant operation_modes::OperationModes::*OPERATION_MODE_STOP* 0)
(intern "*OPERATION_MODE_PRESENT*" (find-package "OPERATION_MODES::OPERATIONMODES"))
(shadow '*OPERATION_MODE_PRESENT* (find-package "OPERATION_MODES::OPERATIONMODES"))
(defconstant operation_modes::OperationModes::*OPERATION_MODE_PRESENT* 1)
(intern "*OPERATION_MODE_ROTATE_360*" (find-package "OPERATION_MODES::OPERATIONMODES"))
(shadow '*OPERATION_MODE_ROTATE_360* (find-package "OPERATION_MODES::OPERATIONMODES"))
(defconstant operation_modes::OperationModes::*OPERATION_MODE_ROTATE_360* 2)
(intern "*OPERATION_MODE_STAY_CLOSE*" (find-package "OPERATION_MODES::OPERATIONMODES"))
(shadow '*OPERATION_MODE_STAY_CLOSE* (find-package "OPERATION_MODES::OPERATIONMODES"))
(defconstant operation_modes::OperationModes::*OPERATION_MODE_STAY_CLOSE* 3)
(intern "*OPERATION_MODE_STAY_AWAY*" (find-package "OPERATION_MODES::OPERATIONMODES"))
(shadow '*OPERATION_MODE_STAY_AWAY* (find-package "OPERATION_MODES::OPERATIONMODES"))
(defconstant operation_modes::OperationModes::*OPERATION_MODE_STAY_AWAY* 4)
(intern "*OPERATION_MODE_FOLLOW*" (find-package "OPERATION_MODES::OPERATIONMODES"))
(shadow '*OPERATION_MODE_FOLLOW* (find-package "OPERATION_MODES::OPERATIONMODES"))
(defconstant operation_modes::OperationModes::*OPERATION_MODE_FOLLOW* 5)
(intern "*OPERATION_MODE_GO_TO_ORIGIN*" (find-package "OPERATION_MODES::OPERATIONMODES"))
(shadow '*OPERATION_MODE_GO_TO_ORIGIN* (find-package "OPERATION_MODES::OPERATIONMODES"))
(defconstant operation_modes::OperationModes::*OPERATION_MODE_GO_TO_ORIGIN* 9)
(intern "*OPERATION_MODE_RIGHT_HAND*" (find-package "OPERATION_MODES::OPERATIONMODES"))
(shadow '*OPERATION_MODE_RIGHT_HAND* (find-package "OPERATION_MODES::OPERATIONMODES"))
(defconstant operation_modes::OperationModes::*OPERATION_MODE_RIGHT_HAND* 14)
(intern "*OPERATION_MODE_LEFT_HAND*" (find-package "OPERATION_MODES::OPERATIONMODES"))
(shadow '*OPERATION_MODE_LEFT_HAND* (find-package "OPERATION_MODES::OPERATIONMODES"))
(defconstant operation_modes::OperationModes::*OPERATION_MODE_LEFT_HAND* 15)
(intern "*OPERATION_MODE_SAVE_LOG*" (find-package "OPERATION_MODES::OPERATIONMODES"))
(shadow '*OPERATION_MODE_SAVE_LOG* (find-package "OPERATION_MODES::OPERATIONMODES"))
(defconstant operation_modes::OperationModes::*OPERATION_MODE_SAVE_LOG* 89)

(defun operation_modes::OperationModes-to-symbol (const)
  (cond
        ((= const 0) 'operation_modes::OperationModes::*OPERATION_MODE_STOP*)
        ((= const 1) 'operation_modes::OperationModes::*OPERATION_MODE_PRESENT*)
        ((= const 2) 'operation_modes::OperationModes::*OPERATION_MODE_ROTATE_360*)
        ((= const 3) 'operation_modes::OperationModes::*OPERATION_MODE_STAY_CLOSE*)
        ((= const 4) 'operation_modes::OperationModes::*OPERATION_MODE_STAY_AWAY*)
        ((= const 5) 'operation_modes::OperationModes::*OPERATION_MODE_FOLLOW*)
        ((= const 9) 'operation_modes::OperationModes::*OPERATION_MODE_GO_TO_ORIGIN*)
        ((= const 14) 'operation_modes::OperationModes::*OPERATION_MODE_RIGHT_HAND*)
        ((= const 15) 'operation_modes::OperationModes::*OPERATION_MODE_LEFT_HAND*)
        ((= const 89) 'operation_modes::OperationModes::*OPERATION_MODE_SAVE_LOG*)
        (t nil)))

(defclass operation_modes::OperationModes
  :super ros::object
  :slots (_header _code ))

(defmethod operation_modes::OperationModes
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:code __code) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _code (round __code))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:code
   (&optional __code)
   (if __code (setq _code __code)) _code)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _code
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _code
       (write-byte _code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _code
     (setq _code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get operation_modes::OperationModes :md5sum-) "974ab5f9fea522ccc10c633de9ff6821")
(setf (get operation_modes::OperationModes :datatype-) "operation_modes/OperationModes")
(setf (get operation_modes::OperationModes :definition-)
      "Header header

uint8 OPERATION_MODE_STOP = 0
uint8 OPERATION_MODE_PRESENT = 1
uint8 OPERATION_MODE_ROTATE_360 = 2
uint8 OPERATION_MODE_STAY_CLOSE = 3
uint8 OPERATION_MODE_STAY_AWAY = 4
uint8 OPERATION_MODE_FOLLOW = 5

uint8 OPERATION_MODE_GO_TO_ORIGIN = 9

uint8 OPERATION_MODE_RIGHT_HAND = 14
uint8 OPERATION_MODE_LEFT_HAND = 15

uint8 OPERATION_MODE_SAVE_LOG = 89

uint8 code
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



(provide :operation_modes/OperationModes "974ab5f9fea522ccc10c633de9ff6821")


