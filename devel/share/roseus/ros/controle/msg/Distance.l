;; Auto-generated. Do not edit!


(when (boundp 'controle::Distance)
  (if (not (find-package "CONTROLE"))
    (make-package "CONTROLE"))
  (shadow 'Distance (find-package "CONTROLE")))
(unless (find-package "CONTROLE::DISTANCE")
  (make-package "CONTROLE::DISTANCE"))

(in-package "ROS")
;;//! \htmlinclude Distance.msg.html


(defclass controle::Distance
  :super ros::object
  :slots (_desired _observation _current ))

(defmethod controle::Distance
  (:init
   (&key
    ((:desired __desired) 0.0)
    ((:observation __observation) 0.0)
    ((:current __current) 0.0)
    )
   (send-super :init)
   (setq _desired (float __desired))
   (setq _observation (float __observation))
   (setq _current (float __current))
   self)
  (:desired
   (&optional __desired)
   (if __desired (setq _desired __desired)) _desired)
  (:observation
   (&optional __observation)
   (if __observation (setq _observation __observation)) _observation)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:serialization-length
   ()
   (+
    ;; float32 _desired
    4
    ;; float32 _observation
    4
    ;; float32 _current
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _desired
       (sys::poke _desired (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _observation
       (sys::poke _observation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _current
       (sys::poke _current (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _desired
     (setq _desired (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _observation
     (setq _observation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _current
     (setq _current (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get controle::Distance :md5sum-) "4895d7c7873380c6167cc39276347c1e")
(setf (get controle::Distance :datatype-) "controle/Distance")
(setf (get controle::Distance :definition-)
      "float32 desired
float32 observation
float32 current
")



(provide :controle/Distance "4895d7c7873380c6167cc39276347c1e")


