
(cl:in-package :asdf)

(defsystem "state_machine-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "DesiredDistance" :depends-on ("_package_DesiredDistance"))
    (:file "_package_DesiredDistance" :depends-on ("_package"))
    (:file "OnChange" :depends-on ("_package_OnChange"))
    (:file "_package_OnChange" :depends-on ("_package"))
  ))