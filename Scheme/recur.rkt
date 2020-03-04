#lang planet neil/sicp
;a^b
(define (my_exp a b)
  (if (= b 0) 1
 (* a (my_exp a (- b 1)))     
  )
)
(define (sum-of-first-n-numbers n)
  (if(< n 1) 1
  (+ n sum-of-first-n-numbers (- 1 n)))
  )