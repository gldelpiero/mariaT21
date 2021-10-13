;; Auto-generated. Do not edit!


(when (boundp 'state_machine::OnChange)
  (if (not (find-package "STATE_MACHINE"))
    (make-package "STATE_MACHINE"))
  (shadow 'OnChange (find-package "STATE_MACHINE")))
(unless (find-package "STATE_MACHINE::ONCHANGE")
  (make-package "STATE_MACHINE::ONCHANGE"))

(in-package "ROS")
;;//! \htmlinclude OnChange.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*PUBLIC*" (find-package "STATE_MACHINE::ONCHANGE"))
(shadow '*PUBLIC* (find-package "STATE_MACHINE::ONCHANGE"))
(defconstant state_machine::OnChange::*PUBLIC* 0)
(intern "*SOCIAL_PUBLIC*" (find-package "STATE_MACHINE::ONCHANGE"))
(shadow '*SOCIAL_PUBLIC* (find-package "STATE_MACHINE::ONCHANGE"))
(defconstant state_machine::OnChange::*SOCIAL_PUBLIC* 1)
(intern "*SOCIAL*" (find-package "STATE_MACHINE::ONCHANGE"))
(shadow '*SOCIAL* (find-package "STATE_MACHINE::ONCHANGE"))
(defconstant state_machine::OnChange::*SOCIAL* 2)
(intern "*PERSONAL_SOCIAL*" (find-package "STATE_MACHINE::ONCHANGE"))
(shadow '*PERSONAL_SOCIAL* (find-package "STATE_MACHINE::ONCHANGE"))
(defconstant state_machine::OnChange::*PERSONAL_SOCIAL* 3)
(intern "*PERSONAL*" (find-package "STATE_MACHINE::ONCHANGE"))
(shadow '*PERSONAL* (find-package "STATE_MACHINE::ONCHANGE"))
(defconstant state_machine::OnChange::*PERSONAL* 4)

(defun state_machine::OnChange-to-symbol (const)
  (cond
        ((= const 0) 'state_machine::OnChange::*PUBLIC*)
        ((= const 1) 'state_machine::OnChange::*SOCIAL_PUBLIC*)
        ((= const 2) 'state_machine::OnChange::*SOCIAL*)
        ((= const 3) 'state_machine::OnChange::*PERSONAL_SOCIAL*)
        ((= const 4) 'state_machine::OnChange::*PERSONAL*)
        (t nil)))

(defclass state_machine::OnChange
  :super ros::object
  :slots (_header _last _current ))

(defmethod state_machine::OnChange
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:last __last) 0)
    ((:current __current) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _last (round __last))
   (setq _current (round __current))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:last
   (&optional __last)
   (if __last (setq _last __last)) _last)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _last
    1
    ;; uint8 _current
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _last
       (write-byte _last s)
     ;; uint8 _current
       (write-byte _current s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _last
     (setq _last (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _current
     (setq _current (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get state_machine::OnChange :md5sum-) "b753c12898c2836606104c967f05183f")
(setf (get state_machine::OnChange :datatype-) "state_machine/OnChange")
(setf (get state_machine::OnChange :definition-)
      "Header header

uint8 PUBLIC = 0
uint8 SOCIAL_PUBLIC = 1
uint8 SOCIAL = 2
uint8 PERSONAL_SOCIAL = 3
uint8 PERSONAL = 4

uint8 last
uint8 current 
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



(provide :state_machine/OnChange "b753c12898c2836606104c967f05183f")


