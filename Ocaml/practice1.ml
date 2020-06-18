open List;;
(*** 1. Write a function
 last : 'a list -> 'a option that returns the last element of 
 a list. (easy)***)
let rec last l= if List.length l=0
              then 0
              else
              if List.length l<2 
              then hd(l)
              else last(tl(l));;
print_int(last [ 1 ; 2 ; 3 ; 4 ]);;
print_string("\n");;
print_int(last([]));;
(***2. Find the last but one (last and penultimate) elements of a
 list.
# last_two [ "a" ; "b" ; "c" ; "d" ];;
- : (string * string) option = Some ("c", "d")
# last_two [ "a" ];;
- : (string * string) option = None
***)
(***let rec last_two =function
            | [] -> None
            | [x] -> x
            | _ :: t -> last_two t;;
last_two([ "a" ; "b" ; "c" ; "d" ]);;
last_two([ "a" ]);;***)