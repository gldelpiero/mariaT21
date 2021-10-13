;; Auto-generated. Do not edit!


(when (boundp 'controle::Emotion)
  (if (not (find-package "CONTROLE"))
    (make-package "CONTROLE"))
  (shadow 'Emotion (find-package "CONTROLE")))
(unless (find-package "CONTROLE::EMOTION")
  (make-package "CONTROLE::EMOTION"))

(in-package "ROS")
;;//! \htmlinclude Emotion.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*EMOTION_ANGER*" (find-package "CONTROLE::EMOTION"))
(shadow '*EMOTION_ANGER* (find-package "CONTROLE::EMOTION"))
(defconstant controle::Emotion::*EMOTION_ANGER* 0)
(intern "*EMOTION_DISGUST*" (find-package "CONTROLE::EMOTION"))
(shadow '*EMOTION_DISGUST* (find-package "CONTROLE::EMOTION"))
(defconstant controle::Emotion::*EMOTION_DISGUST* 1)
(intern "*EMOTION_FEAR*" (find-package "CONTROLE::EMOTION"))
(shadow '*EMOTION_FEAR* (find-package "CONTROLE::EMOTION"))
(defconstant controle::Emotion::*EMOTION_FEAR* 2)
(intern "*EMOTION_HAPPINESS*" (find-package "CONTROLE::EMOTION"))
(shadow '*EMOTION_HAPPINESS* (find-package "CONTROLE::EMOTION"))
(defconstant controle::Emotion::*EMOTION_HAPPINESS* 3)
(intern "*EMOTION_SADNESS*" (find-package "CONTROLE::EMOTION"))
(shadow '*EMOTION_SADNESS* (find-package "CONTROLE::EMOTION"))
(defconstant controle::Emotion::*EMOTION_SADNESS* 4)
(intern "*EMOTION_SUSPRISE*" (find-package "CONTROLE::EMOTION"))
(shadow '*EMOTION_SUSPRISE* (find-package "CONTROLE::EMOTION"))
(defconstant controle::Emotion::*EMOTION_SUSPRISE* 5)
(intern "*EMOTION_TRUST*" (find-package "CONTROLE::EMOTION"))
(shadow '*EMOTION_TRUST* (find-package "CONTROLE::EMOTION"))
(defconstant controle::Emotion::*EMOTION_TRUST* 6)
(intern "*EMOTION_ANTICIPATION*" (find-package "CONTROLE::EMOTION"))
(shadow '*EMOTION_ANTICIPATION* (find-package "CONTROLE::EMOTION"))
(defconstant controle::Emotion::*EMOTION_ANTICIPATION* 7)

(defun controle::Emotion-to-symbol (const)
  (cond
        ((= const 0) 'controle::Emotion::*EMOTION_ANGER*)
        ((= const 1) 'controle::Emotion::*EMOTION_DISGUST*)
        ((= const 2) 'controle::Emotion::*EMOTION_FEAR*)
        ((= const 3) 'controle::Emotion::*EMOTION_HAPPINESS*)
        ((= const 4) 'controle::Emotion::*EMOTION_SADNESS*)
        ((= const 5) 'controle::Emotion::*EMOTION_SUSPRISE*)
        ((= const 6) 'controle::Emotion::*EMOTION_TRUST*)
        ((= const 7) 'controle::Emotion::*EMOTION_ANTICIPATION*)
        (t nil)))

(defclass controle::Emotion
  :super ros::object
  :slots (_header _code _percentage _pleasure _arousal _dominance ))

(defmethod controle::Emotion
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:code __code) 0)
    ((:percentage __percentage) 0)
    ((:pleasure __pleasure) 0)
    ((:arousal __arousal) 0)
    ((:dominance __dominance) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _code (round __code))
   (setq _percentage (round __percentage))
   (setq _pleasure (round __pleasure))
   (setq _arousal (round __arousal))
   (setq _dominance (round __dominance))
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
  (:percentage
   (&optional __percentage)
   (if __percentage (setq _percentage __percentage)) _percentage)
  (:pleasure
   (&optional __pleasure)
   (if __pleasure (setq _pleasure __pleasure)) _pleasure)
  (:arousal
   (&optional __arousal)
   (if __arousal (setq _arousal __arousal)) _arousal)
  (:dominance
   (&optional __dominance)
   (if __dominance (setq _dominance __dominance)) _dominance)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _code
    1
    ;; uint8 _percentage
    1
    ;; int8 _pleasure
    1
    ;; int8 _arousal
    1
    ;; int8 _dominance
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
     ;; uint8 _percentage
       (write-byte _percentage s)
     ;; int8 _pleasure
       (write-byte _pleasure s)
     ;; int8 _arousal
       (write-byte _arousal s)
     ;; int8 _dominance
       (write-byte _dominance s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _code
     (setq _code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _percentage
     (setq _percentage (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int8 _pleasure
     (setq _pleasure (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _pleasure 127) (setq _pleasure (- _pleasure 256)))
   ;; int8 _arousal
     (setq _arousal (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _arousal 127) (setq _arousal (- _arousal 256)))
   ;; int8 _dominance
     (setq _dominance (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _dominance 127) (setq _dominance (- _dominance 256)))
   ;;
   self)
  )

(setf (get controle::Emotion :md5sum-) "6710c8ff5d9ca3e0bda8d2c2af186861")
(setf (get controle::Emotion :datatype-) "controle/Emotion")
(setf (get controle::Emotion :definition-)
      "Header header
uint8 EMOTION_ANGER = 0
uint8 EMOTION_DISGUST = 1
uint8 EMOTION_FEAR = 2
uint8 EMOTION_HAPPINESS = 3
uint8 EMOTION_SADNESS = 4
uint8 EMOTION_SUSPRISE = 5
uint8 EMOTION_TRUST = 6
uint8 EMOTION_ANTICIPATION = 7
uint8 code
uint8 percentage

int8 pleasure
int8 arousal
int8 dominance
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



(provide :controle/Emotion "6710c8ff5d9ca3e0bda8d2c2af186861")


