(in-package :arle-utility)

(defmacro while (test &body body)
  `(do () ((not ,test))
       ,@body))

(defmacro aif (test tbody fbody)
  `(let ((it ,test))
     (if it
         ,tbody
         ,fbody)))

(defmacro alambda (params &body body)
  `(labels ((self ,params
              ,@body))
     #'self))

(defun default-value (valiable value)
  (aif valiable
    it
    value))
