(in-package :cl-user)
(defpackage :arle-utility-asd
    (:use :cl :asdf))
(in-package :arle-utility-asd)

(defsystem :arle-utility
    :class :package-inferred-system
    :description "utility"
    :author "arlechann"
    :depends-on ()
    :components ((:file arle-utility)))
