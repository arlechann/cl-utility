(in-package :arle-utility)

(defun chomp (str)
    (string-right-trim '(#\Return #\Linefeed) str))

(defun parse-request-line (request-line)
    (ppcre:register-groups-bind (method uri version)
        ("^([^ ]+) ([^ ]+) ([^ ]+)$" request-line)
        (values method uri version)))

(defun extract-uri (str)
    (ppcre:scan-to-strings "[A-Za-z]+?://[A-Za-z._-]+:?(?:\\d+)?(?:/[^ ]*)?" str))

(defun parse-uri (uri)
    (ppcre:register-groups-bind (scheme domain port path)
        ("^(.+?)://(.+?):?(\\d+)?(/.*)?$" uri)
        (values scheme domain port path)))
