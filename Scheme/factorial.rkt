#lang planet neil/sicp
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial(- n 1))))
   )
(define (fact-iter prod count max)
  (if (> count max)
      prod
      (fact-iter (* count prod)
                 (+ count 1)
                 max)))
(define (fact n)
  (fact-iter 1 1 n))
;A function f is defined by the rule that f(n) = n
;if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3 
(define (f n)
   (if(< n 3) n
  (+ (+ (f (- n 1)) (* 2 (f (- n 2)))) (* 3 (f (- n 3))))
  )
  )









