(in-package :cl-user)
(defpackage :arle-utility
    (:use cl)
    (:export :openi :openo :opena)
(in-package :arle-utility)

;; file

;; open input
;; https://g000001.cddddr.org/3687641271
(defun openi (file &key (element-type 'cl:character) (external-format :utf-8))
    (open file
          :direction :input
          :element-type element-type
          :external-format external-format))

;; open output
;; https://g000001.cddddr.org/3687641271
(defun openo (file &key (element-type 'cl:character) (external-format :utf-8))
    (open file
          :direction :output
          :element-type element-type
          :external-format external-format
          :if-exists :supersede
          :if-does-not-exist :create))

;; open append
;; https://g000001.cddddr.org/3687641271
(defun opena (file &key (element-type 'cl:character) (external-format :utf-8))
    (open file
          :direction :output
          :element-type element-type
          :external-format external-format
          :if-exists :append
          :if-does-not-exist :create))

