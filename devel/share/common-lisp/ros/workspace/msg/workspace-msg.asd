
(cl:in-package :asdf)

(defsystem "workspace-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "WorkSpace" :depends-on ("_package_WorkSpace"))
    (:file "_package_WorkSpace" :depends-on ("_package"))
  ))