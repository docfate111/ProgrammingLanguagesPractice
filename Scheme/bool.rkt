;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bool) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (xor a b)
  (and (or a b)
      (not (and a b))
      )
  )
;(if) evaluates to a boolean
; if true: it evaluates the first expression after it, if false: next one
(define (inv a)
  (if (= a 0) 0 (/ 1 a)))
;an expression that converts the value of in to a
;positive number. For a String, it determines how long
;the String is
(define (in a)
  (if (string? a)(string-length a)
      (if (number? a)
          (if (>= a 0) a (* -1 a))
          "error")
      )
  )
; for a Number, it decrements the number by 1, unless it is already 0 or negative; for #true it uses 10 and for #false 20.
;function consumes two Boolean values, call them sunny
;and friday. Its answer is #true if sunny is false or
;friday is true
;==> means implication
(define (==> sunny friday)
  (or
   (not sunny)
   friday) 
  )























