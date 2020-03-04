#lang planet neil/sicp
;inserts string into ith position: 
(define (insert s i str)
  (string-append
   (substring s 0 i)(string-append str (substring s i))))
;replaces ith character with str
(define (replace s i str)(string-append(string-append(substring s 0 i)str)
 s (+ i 1)))
;removes ith character from string s
(define (delete s i)
  (string-append
   (substring s 0 i)
   (substring s (+ i 1))
   ))
;first character
(define (first-string s)(substring s 0 1))
;last character
(define (string-last s)
  (substring s (- (string-length s) 1)))
;consumes two strings and appends them with "_" in
;between
(define (string-join a b)
  (string-append (string-append a "_") b))
;produces a string like the given one
;with the first character removed
(define (string-rest str)
  (substring str 1)
)
;produces a string like the given one
;with the last character removed
(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1))
  )





















  