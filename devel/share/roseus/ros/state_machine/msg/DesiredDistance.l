;; Auto-generated. Do not edit!


(when (boundp 'state_machine::DesiredDistance)
  (if (not (find-package "STATE_MACHINE"))
    (make-package "STATE_MACHINE"))
  (shadow 'DesiredDistance (find-package "STATE_MACHINE")))
(unless (find-package "STATE_MACHINE::DESIREDDISTANCE")
  (make-package "STATE_MACHINE::DESIREDDISTANCE"))

(in-package "ROS")
;;//! \htmlinclude DesiredDistance.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass state_machine::DesiredDistance
  :super ros::object
  :slots (_header _desired_distance ))

(defmethod state_machine::DesiredDistance
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:desired_distance __desired_distance) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _desired_distance (float __desired_distance))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:desired_distance
   (&optional __desired_distance)
   (if __desired_distance (setq _desired_distance __desired_distance)) _desired_distance)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _desired_distance
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _desired_distance
       (sys::poke _desired_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _desired_distance
     (setq _desired_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get state_machine::DesiredDistance :md5sum-) "5094fd976ee33ff6551fcacedcbae61f")
(setf (get state_machine::DesiredDistance :datatype-) "state_machine/DesiredDistance")
(setf (get state_machine::DesiredDistance :definition-)
      "Header header
float64 desired_distance
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



(provide :state_machine/DesiredDistance "5094fd976ee33ff6551fcacedcbae61f")


