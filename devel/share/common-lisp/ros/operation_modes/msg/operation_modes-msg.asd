
(cl:in-package :asdf)

(defsystem "operation_modes-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "OperationModes" :depends-on ("_package_OperationModes"))
    (:file "_package_OperationModes" :depends-on ("_package"))
  ))