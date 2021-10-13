;; Auto-generated. Do not edit!


(when (boundp 'controle::Plutchik)
  (if (not (find-package "CONTROLE"))
    (make-package "CONTROLE"))
  (shadow 'Plutchik (find-package "CONTROLE")))
(unless (find-package "CONTROLE::PLUTCHIK")
  (make-package "CONTROLE::PLUTCHIK"))

(in-package "ROS")
;;//! \htmlinclude Plutchik.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass controle::Plutchik
  :super ros::object
  :slots (_header _joy_sadness _surprise_anticipation _anger_fear _trust_disgust ))

(defmethod controle::Plutchik
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:joy_sadness __joy_sadness) 0)
    ((:surprise_anticipation __surprise_anticipation) 0)
    ((:anger_fear __anger_fear) 0)
    ((:trust_disgust __trust_disgust) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _joy_sadness (round __joy_sadness))
   (setq _surprise_anticipation (round __surprise_anticipation))
   (setq _anger_fear (round __anger_fear))
   (setq _trust_disgust (round __trust_disgust))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:joy_sadness
   (&optional __joy_sadness)
   (if __joy_sadness (setq _joy_sadness __joy_sadness)) _joy_sadness)
  (:surprise_anticipation
   (&optional __surprise_anticipation)
   (if __surprise_anticipation (setq _surprise_anticipation __surprise_anticipation)) _surprise_anticipation)
  (:anger_fear
   (&optional __anger_fear)
   (if __anger_fear (setq _anger_fear __anger_fear)) _anger_fear)
  (:trust_disgust
   (&optional __trust_disgust)
   (if __trust_disgust (setq _trust_disgust __trust_disgust)) _trust_disgust)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _joy_sadness
    1
    ;; int8 _surprise_anticipation
    1
    ;; int8 _anger_fear
    1
    ;; int8 _trust_disgust
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _joy_sadness
       (write-byte _joy_sadness s)
     ;; int8 _surprise_anticipation
       (write-byte _surprise_anticipation s)
     ;; int8 _anger_fear
       (write-byte _anger_fear s)
     ;; int8 _trust_disgust
       (write-byte _trust_disgust s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _joy_sadness
     (setq _joy_sadness (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _joy_sadness 127) (setq _joy_sadness (- _joy_sadness 256)))
   ;; int8 _surprise_anticipation
     (setq _surprise_anticipation (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _surprise_anticipation 127) (setq _surprise_anticipation (- _surprise_anticipation 256)))
   ;; int8 _anger_fear
     (setq _anger_fear (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _anger_fear 127) (setq _anger_fear (- _anger_fear 256)))
   ;; int8 _trust_disgust
     (setq _trust_disgust (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _trust_disgust 127) (setq _trust_disgust (- _trust_disgust 256)))
   ;;
   self)
  )

(setf (get controle::Plutchik :md5sum-) "3de017963cf6b074941410adf7783cb7")
(setf (get controle::Plutchik :datatype-) "controle/Plutchik")
(setf (get controle::Plutchik :definition-)
      "Header header
int8 joy_sadness
int8 surprise_anticipation
int8 anger_fear
int8 trust_disgust
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



(provide :controle/Plutchik "3de017963cf6b074941410adf7783cb7")


