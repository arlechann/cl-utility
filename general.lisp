(in-package :arle-utility)

(defmacro aif (pred tbody fbody)
    `(let ((it ,pred))
        (if it
            ,tbody
            ,fbody)))

(defun default-value (valiable value)
    (aif valiable
        it
        value))
