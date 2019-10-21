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
                 (:file "string" :depends-on ("package"))
                 (:file "file" :depends-on ("package"))
                 (:file "delay" :depends-on ("package"))
                 )
    :in-order-to ((test-op (test-op arle-utility-test))))

(defsystem :arle-utility/test
    :description "test"
    :depends-on (:arle-utility :prove)
    :defsystem-depends-on (:prove-asdf)
    :components ((:file "test/package")
                 (:test-file "test/general-test" :depends-on ("test/package"))
                 (:test-file "test/string-test" :depends-on ("test/package"))
                 (:test-file "test/file-test" :depends-on ("test/package"))
                 (:test-file "test/delay-test" :depends-on ("test/package"))
                 )
    :perform (test-op :after (op c)
                      (funcall (intern #.(string :run) :prove) c)))

;;; vim: set ft=lisp lisp:
