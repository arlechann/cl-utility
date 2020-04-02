(in-package :arle-utility)

(defun alist-keys (alist)
  (mapcar (lambda (pair) (car pair)) alist))

(defun alist-values (alist))
