#lang sicp
(define (f n)
  (
  (if(< 3 n)(n))
  (+ (f (dec n)) (* 2 (f (- 2 n))) (* 3 (f (- 3 n))))
  ))
(f 4)
