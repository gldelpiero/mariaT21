
(cl:in-package :asdf)

(defsystem "controle-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Data" :depends-on ("_package_Data"))
    (:file "_package_Data" :depends-on ("_package"))
    (:file "Distance" :depends-on ("_package_Distance"))
    (:file "_package_Distance" :depends-on ("_package"))
    (:file "Emotion" :depends-on ("_package_Emotion"))
    (:file "_package_Emotion" :depends-on ("_package"))
    (:file "Plutchik" :depends-on ("_package_Plutchik"))
    (:file "_package_Plutchik" :depends-on ("_package"))
  ))