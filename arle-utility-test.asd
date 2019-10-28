(in-package :cl-user)
(defpackage :arle-utility-test-asd
  (:use :cl :asdf))
(in-package :arle-utility-test-asd)

(defsystem :arle-utility-test
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
