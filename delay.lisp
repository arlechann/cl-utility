(in-package :arle-utility)

(defmacro delay (body)
  (let ((forced (gensym)))
    `(let ((,forced 'unforced))
      (lambda ()
        (if (eq ,forced 'unforced)
            (setf ,forced ,body))
        ,forced))))

(defun force (body)
  (funcall body))

(defmacro stream-cons (car cdr)
  `(delay (cons ,car ,cdr)))

(defun stream-car (stream)
  (car (force stream)))

(defun stream-cdr (stream)
  (cdr (force stream)))

(defun stream-take (n stream)
  (if (> n 0)
      (cons (stream-car stream) (stream-take (- n 1) (stream-cdr stream)))
      '()))

(defun stream-take-while (fn stream)
  (if (funcall fn (stream-car stream))
      (cons (stream-car stream) (stream-take-while fn (stream-cdr stream)))
      '()))

(defun const-stream (n)
  (let ((cdr nil))
    (setf cdr (stream-cons n cdr))
    cdr))

(defun stream-iota (start &optional (step 1))
  (stream-cons start (stream-iota (+ start step) step)))

(defun stream-nth (n stream)
  (if (<= n 0)
      (stream-car stream)
      (stream-nth (- n 1) (stream-cdr stream))))

(defun stream-map1 (fn stream)
  (stream-cons (funcall fn (stream-car stream))
               (stream-map1 fn (stream-cdr stream))))

(defun stream-map (fn &rest streams)
  (stream-cons (apply fn (mapcar #'stream-car streams))
               (apply #'stream-map fn (mapcar #'stream-cdr streams))))

(defun stream-filter (fn stream)
  (if (funcall fn (stream-car stream))
      (stream-cons (stream-car stream) (stream-filter fn (stream-cdr stream)))
      (stream-filter fn (stream-cdr stream))))

(defun prime-stream ()
  (let ((stream (stream-cons 2 (stream-iota 3 2))))
    (stream-filter (lambda (n)
                     (labels ((rec (stream)
                                (let ((head (stream-car stream)))
                                  (if (< n (* head head))
                                      t
                                      (if (zerop (mod n head))
                                          nil
                                          (rec (stream-cdr stream)))))))
                       (rec stream)))
                   stream)))

