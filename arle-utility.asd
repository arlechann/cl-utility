(in-package :cl-user)
(defpackage :arle-utility-asd
  (:use :cl :asdf))
(in-package :arle-utility-asd)

(defsystem :arle-utility
           :description "utility"
           :author "arlechann"
           :depends-on (:cl-ppcre)
           :components ((:file "package")
                        (:file "general" :depends-on ("package"))
                        (:file "list" :depends-on ("package"))
                        (:file "string" :depends-on ("package"))
                        (:file "file" :depends-on ("package"))
                        (:file "delay" :depends-on ("package"))
                        )
           :in-order-to ((test-op (test-op arle-utility-test))))

;;; vim: set ft=lisp lisp:
