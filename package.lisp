(in-package :cl-user)
(defpackage :arle-utility
    (:use cl)
    (:export
        ;; general
        :aif
        :it
        :default-value

        ;; string
        :parse-request-line
        :extract-uri
        :parse-uri

        ;; file
        :openi
        :openo
        :opena
        ))
