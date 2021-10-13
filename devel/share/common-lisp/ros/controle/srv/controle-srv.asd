
(cl:in-package :asdf)

(defsystem "controle-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ChangeMode" :depends-on ("_package_ChangeMode"))
    (:file "_package_ChangeMode" :depends-on ("_package"))
  ))