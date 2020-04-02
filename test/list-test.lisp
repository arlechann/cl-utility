(in-package :arle-utility/test)

(subtest
  "alist-keys"
  (is
    (alist-keys '((1 . a) (2 . b) (3 . c)))
    '(1 2 3)
    :test #'equal)
  (is
    (alist-keys '((a 1 2 3) (b 4 5 6) (c 7 8 9)))
    '(a b c)
    :test #'equal)
  (is
    (alist-keys '())
    '()
    :test #'equal))
