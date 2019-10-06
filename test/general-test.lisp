(in-package :arle-utility-test)

(is-expand
    (arle-utility:aif t t nil)
    (let ((arle-utility:it t))
        (if arle-utility:it
            t
            nil)))

(ok (arle-utility:default-value nil t))
(ok (arle-utility:default-value t nil))

(finalize)
