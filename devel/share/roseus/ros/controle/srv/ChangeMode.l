;; Auto-generated. Do not edit!


(when (boundp 'controle::ChangeMode)
  (if (not (find-package "CONTROLE"))
    (make-package "CONTROLE"))
  (shadow 'ChangeMode (find-package "CONTROLE")))
(unless (find-package "CONTROLE::CHANGEMODE")
  (make-package "CONTROLE::CHANGEMODE"))
(unless (find-package "CONTROLE::CHANGEMODEREQUEST")
  (make-package "CONTROLE::CHANGEMODEREQUEST"))
(unless (find-package "CONTROLE::CHANGEMODERESPONSE")
  (make-package "CONTROLE::CHANGEMODERESPONSE"))

(in-package "ROS")





(defclass controle::ChangeModeRequest
  :super ros::object
  :slots (_mode ))

(defmethod controle::ChangeModeRequest
  (:init
   (&key
    ((:mode __mode) 0)
    )
   (send-super :init)
   (setq _mode (round __mode))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; uint8 _mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _mode
       (write-byte _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass controle::ChangeModeResponse
  :super ros::object
  :slots (_status ))

(defmethod controle::ChangeModeResponse
  (:init
   (&key
    ((:status __status) nil)
    )
   (send-super :init)
   (setq _status __status)
   self)
  (:status
   (&optional (__status :null))
   (if (not (eq __status :null)) (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; bool _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _status
       (if _status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _status
     (setq _status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass controle::ChangeMode
  :super ros::object
  :slots ())

(setf (get controle::ChangeMode :md5sum-) "6355e26f776c047b791d9822fff786f9")
(setf (get controle::ChangeMode :datatype-) "controle/ChangeMode")
(setf (get controle::ChangeMode :request) controle::ChangeModeRequest)
(setf (get controle::ChangeMode :response) controle::ChangeModeResponse)

(defmethod controle::ChangeModeRequest
  (:response () (instance controle::ChangeModeResponse :init)))

(setf (get controle::ChangeModeRequest :md5sum-) "6355e26f776c047b791d9822fff786f9")
(setf (get controle::ChangeModeRequest :datatype-) "controle/ChangeModeRequest")
(setf (get controle::ChangeModeRequest :definition-)
      "uint8 mode
---
bool status
")

(setf (get controle::ChangeModeResponse :md5sum-) "6355e26f776c047b791d9822fff786f9")
(setf (get controle::ChangeModeResponse :datatype-) "controle/ChangeModeResponse")
(setf (get controle::ChangeModeResponse :definition-)
      "uint8 mode
---
bool status
")



(provide :controle/ChangeMode "6355e26f776c047b791d9822fff786f9")


