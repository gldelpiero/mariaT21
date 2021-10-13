;; Auto-generated. Do not edit!


(when (boundp 'controle::Data)
  (if (not (find-package "CONTROLE"))
    (make-package "CONTROLE"))
  (shadow 'Data (find-package "CONTROLE")))
(unless (find-package "CONTROLE::DATA")
  (make-package "CONTROLE::DATA"))

(in-package "ROS")
;;//! \htmlinclude Data.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*PROXEMIC_ZONE_PUBLIC*" (find-package "CONTROLE::DATA"))
(shadow '*PROXEMIC_ZONE_PUBLIC* (find-package "CONTROLE::DATA"))
(defconstant controle::Data::*PROXEMIC_ZONE_PUBLIC* 0)
(intern "*PROXEMIC_ZONE_SOCIAL_PUBLIC*" (find-package "CONTROLE::DATA"))
(shadow '*PROXEMIC_ZONE_SOCIAL_PUBLIC* (find-package "CONTROLE::DATA"))
(defconstant controle::Data::*PROXEMIC_ZONE_SOCIAL_PUBLIC* 1)
(intern "*PROXEMIC_ZONE_SOCIAL*" (find-package "CONTROLE::DATA"))
(shadow '*PROXEMIC_ZONE_SOCIAL* (find-package "CONTROLE::DATA"))
(defconstant controle::Data::*PROXEMIC_ZONE_SOCIAL* 2)
(intern "*PROXEMIC_ZONE_PERSONAL_SOCIAL*" (find-package "CONTROLE::DATA"))
(shadow '*PROXEMIC_ZONE_PERSONAL_SOCIAL* (find-package "CONTROLE::DATA"))
(defconstant controle::Data::*PROXEMIC_ZONE_PERSONAL_SOCIAL* 3)
(intern "*PROXEMIC_ZONE_PERSONAL*" (find-package "CONTROLE::DATA"))
(shadow '*PROXEMIC_ZONE_PERSONAL* (find-package "CONTROLE::DATA"))
(defconstant controle::Data::*PROXEMIC_ZONE_PERSONAL* 4)
(intern "*WORKSPACE_AREA_EXTERNAL*" (find-package "CONTROLE::DATA"))
(shadow '*WORKSPACE_AREA_EXTERNAL* (find-package "CONTROLE::DATA"))
(defconstant controle::Data::*WORKSPACE_AREA_EXTERNAL* 0)
(intern "*WORKSPACE_AREA_OBSERVATION*" (find-package "CONTROLE::DATA"))
(shadow '*WORKSPACE_AREA_OBSERVATION* (find-package "CONTROLE::DATA"))
(defconstant controle::Data::*WORKSPACE_AREA_OBSERVATION* 1)
(intern "*WORKSPACE_AREA_INTERACTION*" (find-package "CONTROLE::DATA"))
(shadow '*WORKSPACE_AREA_INTERACTION* (find-package "CONTROLE::DATA"))
(defconstant controle::Data::*WORKSPACE_AREA_INTERACTION* 2)

(defun controle::Data-to-symbol (const)
  (cond
        ((= const 0) 'controle::Data::*PROXEMIC_ZONE_PUBLIC*)
        ((= const 1) 'controle::Data::*PROXEMIC_ZONE_SOCIAL_PUBLIC*)
        ((= const 2) 'controle::Data::*PROXEMIC_ZONE_SOCIAL*)
        ((= const 3) 'controle::Data::*PROXEMIC_ZONE_PERSONAL_SOCIAL*)
        ((= const 4) 'controle::Data::*PROXEMIC_ZONE_PERSONAL*)
        ((= const 0) 'controle::Data::*WORKSPACE_AREA_EXTERNAL*)
        ((= const 1) 'controle::Data::*WORKSPACE_AREA_OBSERVATION*)
        ((= const 2) 'controle::Data::*WORKSPACE_AREA_INTERACTION*)
        (t nil)))

(defclass controle::Data
  :super ros::object
  :slots (_header _distance _angle _proxemic_zone _workspace_area ))

(defmethod controle::Data
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:distance __distance) (instance controle::Distance :init))
    ((:angle __angle) 0.0)
    ((:proxemic_zone __proxemic_zone) 0)
    ((:workspace_area __workspace_area) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _distance __distance)
   (setq _angle (float __angle))
   (setq _proxemic_zone (round __proxemic_zone))
   (setq _workspace_area (round __workspace_area))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:distance
   (&rest __distance)
   (if (keywordp (car __distance))
       (send* _distance __distance)
     (progn
       (if __distance (setq _distance (car __distance)))
       _distance)))
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:proxemic_zone
   (&optional __proxemic_zone)
   (if __proxemic_zone (setq _proxemic_zone __proxemic_zone)) _proxemic_zone)
  (:workspace_area
   (&optional __workspace_area)
   (if __workspace_area (setq _workspace_area __workspace_area)) _workspace_area)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; controle/Distance _distance
    (send _distance :serialization-length)
    ;; float32 _angle
    4
    ;; uint8 _proxemic_zone
    1
    ;; uint8 _workspace_area
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; controle/Distance _distance
       (send _distance :serialize s)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _proxemic_zone
       (write-byte _proxemic_zone s)
     ;; uint8 _workspace_area
       (write-byte _workspace_area s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; controle/Distance _distance
     (send _distance :deserialize buf ptr-) (incf ptr- (send _distance :serialization-length))
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _proxemic_zone
     (setq _proxemic_zone (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _workspace_area
     (setq _workspace_area (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get controle::Data :md5sum-) "8e71096c455d398c228a2768f716cf97")
(setf (get controle::Data :datatype-) "controle/Data")
(setf (get controle::Data :definition-)
      "Header header
controle/Distance distance
float32 angle
uint8 PROXEMIC_ZONE_PUBLIC = 0
uint8 PROXEMIC_ZONE_SOCIAL_PUBLIC = 1
uint8 PROXEMIC_ZONE_SOCIAL = 2
uint8 PROXEMIC_ZONE_PERSONAL_SOCIAL = 3
uint8 PROXEMIC_ZONE_PERSONAL = 4
uint8 proxemic_zone
uint8 WORKSPACE_AREA_EXTERNAL = 0
uint8 WORKSPACE_AREA_OBSERVATION = 1
uint8 WORKSPACE_AREA_INTERACTION = 2
uint8 workspace_area
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

================================================================================
MSG: controle/Distance
float32 desired
float32 observation
float32 current
")



(provide :controle/Data "8e71096c455d398c228a2768f716cf97")


