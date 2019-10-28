(in-package :arle-utility/test)

(subtest
  "delay"
  (is-expand
    (delay (+ 2 3))
    (let (($forced 'arle-utility::unforced))
      (lambda ()
        (if (eq $forced 'arle-utility::unforced)
            (setf $forced (+ 2 3)))
        $forced)))
  (is-expand
    (delay (format t "format~%"))
    (let (($forced 'arle-utility::unforced))
      (lambda ()
        (if (eq $forced 'arle-utility::unforced)
            (setf $forced (format t "format~%")))
        $forced)))
  )

(subtest
  "force"
  (is (force (delay (+ 2 3)))
      5)
  (is-print
    (let ((delayed (delay (format t "format~%"))))
      (force delayed)
      (force delayed))
    "format
")
  )

(subtest
  "stream-cons"
  (is-expand
    (stream-cons 'car 'cdr)
    (delay (cons 'car 'cdr)))
  )

(subtest
  "stream-car"
  (is (stream-car (stream-cons 'car 'cdr))
      'car)
  )

(subtest
  "stream-cdr"
  (is (stream-cdr (stream-cons 'car 'cdr))
      'cdr)
  )

(subtest
  "stream-take"
  (is (stream-take 1 (stream-cons 'car 'cdr))
      '(car))
  (is (stream-take 3 (stream-cons '1 (stream-cons '2 (stream-cons '3 (stream-cons '4 '5)))))
      '(1 2 3))
  )

(subtest
  "stream-take-while"
  (is (stream-take-while (lambda (n) (< n 3))
                         (stream-cons 1 (stream-cons 3 (stream-cons 5 nil))))
      '(1))
  (is (stream-take-while (lambda (n) nil)
                         (stream-cons 1 (stream-cons 3 (stream-cons 5 nil))))
      '())
  )

(subtest
  "const-stream"
  (is (stream-take 10 (const-stream 1))
      '(1 1 1 1 1 1 1 1 1 1))
  (is (stream-take 10 (const-stream 'stream))
      '(stream stream stream stream stream stream stream stream stream stream))
  )

(subtest
  "stream-iota"
  (is (stream-take 10 (stream-iota 0))
      '(0 1 2 3 4 5 6 7 8 9))
  (is (stream-take 10 (stream-iota 50 -10))
      '(50 40 30 20 10 0 -10 -20 -30 -40))
  (is (stream-take 10 (stream-iota 0 1/2))
      '(0 1/2 1 3/2 2 5/2 3 7/2 4 9/2))
  )

(subtest
  "stream-nth"
  (is (stream-nth 0 (stream-iota 0))
      0)
  (is (stream-nth 10 (stream-iota 0))
      10)
  (is (stream-nth -10 (stream-iota 0))
      0)
  )

(subtest
  "stream-map"
  (is (stream-take 3 (stream-map (lambda (n) (+ n 1)) (const-stream 1)))
      '(2 2 2))
  (is (stream-take 3 (stream-map #'char-upcase (const-stream #\a)))
      '(#\A #\A #\A))
  (is (stream-take 3 (stream-map (lambda (n) (* n 2)) (stream-iota 0)))
      '(0 2 4))
  )

(subtest
  "stream-filter"
  (is (stream-take 3 (stream-filter #'oddp (stream-iota 0)))
      '(1 3 5))
  (is (stream-take 3 (stream-filter (lambda (n) (zerop (mod n 5))) (stream-iota 0)))
      '(0 5 10))
  )

(subtest
  "prime-stream"
  (is (stream-take 100 (prime-stream))
      '(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229 233 239 241 251 257 263 269 271 277 281 283 293 307 311 313 317 331 337 347 349 353 359 367 373 379 383 389 397 401 409 419 421 431 433 439 443 449 457 461 463 467 479 487 491 499 503 509 521 523 541))
  )

(finalize)

