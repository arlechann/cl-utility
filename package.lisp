(in-package :cl-user)
(defpackage :arle-utility
  (:use cl)
  (:export
    ;; general
    :while
    :aif
    :it
    :alambda
    :self
    :default-value

    ;; string
    :chomp
    :parse-request-line
    :extract-uri
    :parse-uri

    ;; file
    :openi
    :openo
    :opena

    ;; delay
    :delay
    :force
    :stream-cons
    :stream-car
    :stream-cdr
    :stream-take
    :stream-take-while
    :const-stream
    :stream-iota
    :stream-nth
    :stream-map
    :stream-filter
    :prime-stream
    ))

