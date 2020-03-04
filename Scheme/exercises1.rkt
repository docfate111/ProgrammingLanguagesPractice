#lang sicp
;Define a procedure that takes three numbers as arguments and returns
;the sum of the squares of the two larger numbers.
(define (square x) (* x x))
(define (sum_of_squares q w) (+ (square q) (square w)))
(define (special_sum a b c)
  ( cond ((= a (min a b c)) (sum_of_squares b c))
         ((= b (min a b c)) (sum_of_squares a c))
         ((= c (min a b c)) (sum_of_squares b a))
         )
)
(special_sum 3 4 5)
(define (test x y)(if (= x 0) 0 y ))
(define (p) (p))
(test 0 (p))


