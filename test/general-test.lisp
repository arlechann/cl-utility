(in-package :arle-utility-test)

(subtest
  "while"
  (is-expand
    (while t
           (print nil))
    (do () ((not t))
        (print nil)))
  (is-print
    (let ((i 0))
      (while (< i 5)
             (format t "~A~%" i)
             (setf i (+ i 1))))
    "0
1
2
3
4
")
   )

(subtest
  "aif"
  (is-expand
    (aif t t nil)
    (let ((it t))
      (if it
          t
          nil)))
  )

(subtest
  "alambda"
  (is-expand
    (alambda () (self))
    (labels ((self ()
               (self)))
      #'self))
  (is (funcall (alambda (n)
        (if (zerop n)
            1
            (* n (self (- n 1)))))
       5)
      (labels ((fact (n)
                 (if (zerop n)
                     1
                     (* n (fact (- n 1))))))
        (fact 5)))
  )

(subtest
  "default-value"
  (ok (default-value nil t))
  (ok (default-value t nil))
  )

(finalize)
