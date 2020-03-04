;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname math) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;a function that consumes two numbers
;, x and y, and that computes the distance of point (x,y) to the origin
(define (dist_to_origin x y)(sqrt (+(* x x) (* y y))) )
;accepts the length
;of a side of an equilateral cube and computes its volume
(define (cube_vol x) (* x (* x x) ))
;surface area of cube
(define (cube_sa x) (* 6(* x x)))