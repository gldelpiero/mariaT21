
(cl:in-package :asdf)

(defsystem "child_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :general_functions-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ChildDetection" :depends-on ("_package_ChildDetection"))
    (:file "_package_ChildDetection" :depends-on ("_package"))
  ))