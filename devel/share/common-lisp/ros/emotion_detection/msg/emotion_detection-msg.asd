
(cl:in-package :asdf)

(defsystem "emotion_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Vector4d" :depends-on ("_package_Vector4d"))
    (:file "_package_Vector4d" :depends-on ("_package"))
  ))