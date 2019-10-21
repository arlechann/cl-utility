(in-package :arle-utility-test)

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
  "default-value"
  (ok (default-value nil t))
  (ok (default-value t nil))
  )

(finalize)
