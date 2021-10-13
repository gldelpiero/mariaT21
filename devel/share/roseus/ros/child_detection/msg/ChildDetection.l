;; Auto-generated. Do not edit!


(when (boundp 'child_detection::ChildDetection)
  (if (not (find-package "CHILD_DETECTION"))
    (make-package "CHILD_DETECTION"))
  (shadow 'ChildDetection (find-package "CHILD_DETECTION")))
(unless (find-package "CHILD_DETECTION::CHILDDETECTION")
  (make-package "CHILD_DETECTION::CHILDDETECTION"))

(in-package "ROS")
;;//! \htmlinclude ChildDetection.msg.html
(if (not (find-package "GENERAL_FUNCTIONS"))
  (ros::roseus-add-msgs "general_functions"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass child_detection::ChildDetection
  :super ros::object
  :slots (_header _detected _angle _distance _child_position ))

(defmethod child_detection::ChildDetection
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:detected __detected) nil)
    ((:angle __angle) 0.0)
    ((:distance __distance) 0.0)
    ((:child_position __child_position) (instance general_functions::Position :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _detected __detected)
   (setq _angle (float __angle))
   (setq _distance (float __distance))
   (setq _child_position __child_position)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:detected
   (&optional (__detected :null))
   (if (not (eq __detected :null)) (setq _detected __detected)) _detected)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:child_position
   (&rest __child_position)
   (if (keywordp (car __child_position))
       (send* _child_position __child_position)
     (progn
       (if __child_position (setq _child_position (car __child_position)))
       _child_position)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _detected
    1
    ;; float64 _angle
    8
    ;; float64 _distance
    8
    ;; general_functions/Position _child_position
    (send _child_position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _detected
       (if _detected (write-byte -1 s) (write-byte 0 s))
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; general_functions/Position _child_position
       (send _child_position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _detected
     (setq _detected (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; general_functions/Position _child_position
     (send _child_position :deserialize buf ptr-) (incf ptr- (send _child_position :serialization-length))
   ;;
   self)
  )

(setf (get child_detection::ChildDetection :md5sum-) "5c7596216903a2154c277a5c52dc0801")
(setf (get child_detection::ChildDetection :datatype-) "child_detection/ChildDetection")
(setf (get child_detection::ChildDetection :definition-)
      "Header header

# Is there a child?
bool detected

# If there is a child, contains the angle between the sensor and the child
# otherwise, contains 0
# angle is in (-180, 180] degrees
float64 angle

# If there is a child, contains the distance between the sensor and the child [in meters]
# otherwise, contains 0
# distance is in meters
float64 distance

# If there is a child, contais the global position of the child
# otherwise, contains (0, 0, 0)
general_functions/Position  child_position
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
MSG: general_functions/Position
float64 x
float64 y
float64 angle
")



(provide :child_detection/ChildDetection "5c7596216903a2154c277a5c52dc0801")


