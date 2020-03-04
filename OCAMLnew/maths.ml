open List;;
(*some really useful functions I use in this code*)
let rec range start fin=if start=fin then [start] 
                          else start::(range (start+1) fin);;
let rec sum l=match l with
    | [] -> 0
    | h::t -> h+sum(t);;
let rec print_listi = function 
    [] -> ()
    | e::l -> print_int e ; print_string " " ; print_listi l;;
let rec print_lists = function 
    [] -> ()
    | e::l -> print_string e ; print_string " " ; print_lists l;;
(*31. Determine whether a given integer number is prime. *)
let is_prime n=if n<=1 then false else 
length(filter (fun x -> x=0) (map (fun x -> (n mod x)) (range 2 (n-1))))=0;;
assert(not(is_prime(1))&& is_prime(7) && not (is_prime(12)));;
(*32. Determine the greatest common divisor of two positive 
integer numbers.*)
let rec gcd a b=if b=0 then a else gcd b (a mod b);;
assert((gcd 13 27=1) && (gcd 20536 7826)=2);;
(*Determine whether two positive integer numbers are coprime.*)
let coprime a b=gcd a b=1;;
assert((coprime 13 27) && (not(coprime 20536 7826)));;
(*34. Calculate Euler's totient function φ(m). *)
let isfactorof a b=a mod b=0;;
let phi m=length(filter (fun x -> coprime m x) (range 1 (m-1)));;
assert(phi(10)=4);;
assert(phi(13)=12);;
(*35. Determine the prime factors of a given positive integer. *)
let isprime n =
  let n = abs n in
  let rec is_not_divisor d =
    d * d > n || (n mod d <> 0 && is_not_divisor (d+1)) in
  n <> 1 && is_not_divisor 2;;
let factors_up_to n=(filter (isfactorof n) (filter isprime (range 2 (n-1))));;
let rec factorsn n l=if n=1 then [] else
                if(length(l)>0) then
                  if((n/(hd(l))) mod hd(l)=0) then
                  hd(l)::(factorsn (n/(hd(l))) l)
                  else hd(l)::(factorsn (n/(hd(l))) (tl(l)))
                else [];;
let factors n=factorsn n (factors_up_to(n));;
assert(factors(315)=[3; 3; 5; 7]);;
(*36. Determine the prime factors of a given positive integer.
Construct a list containing the prime factors and their 
multiplicity.*)
let rec freq a=function 
| [] -> 0
| h::t -> if h=a then 1+freq a t else freq a t;;
let rec factorfreq l=match l with
    | [] -> [] 
    | h::t -> (h, (freq h l))::(factorfreq (filter (fun x->x!=h) t));;
let factors2 n=factorfreq (factors n);;
assert(factors2(315)=[(3, 2); (5, 1); (7, 1)]);;
(*37. Calculate Euler's totient function φ(m)*)
let rec pow n p = if p < 1 then 1 else n * pow n (p-1);;
let rec phi_improvedn=function
    | [] -> 1
    | (p,m)::[] -> ((p-1)*(pow p (m-1)))
    | (p,m)::t ->
    ((p-1)*(pow p (m-1)))
    *(phi_improvedn(t));;
let phi_improved n=if isprime(n) then n-1
                    else phi_improvedn (factors2 n);;
assert((phi_improved 10)=4);;
assert((phi_improved 13)=12);;
(*38. Compare the two methods of calculating Euler's totient 
function. Use the solutions of problems "Calculate Euler's totient function
 φ(m)" and "Calculate Euler's totient function φ(m) (improved)" 
 to compare the algorithms. Take the number of logical inferences
  as a measure for efficiency. Try to calculate φ(10090) as an 
  example
(This code comment out because I don't have to have to keep
 compiling with Unix.cma for all the questions after)
let timeit f n=  let t = Unix.gettimeofday () in
let res = f n in
Printf.printf "Execution time: %f seconds"
              (Unix.gettimeofday () -. t);
res
;;
timeit phi 10090;;
print_string("\n");;
timeit phi_improved 10090;;
This prints out: Execution time: 0.003824 seconds
                 Execution time: 0.005149 seconds*)
(*39. A list of prime numbers.*)
let all_primes start fin=filter isprime (range start fin);;
assert(length (all_primes 2 7920)=1000);;
(*40. Goldbach's conjecture.
Goldbach's conjecture says that every positive even number 
greater than 2 is the sum of two prime numbers. 
Example: 28 = 5 + 23. It is one of the most famous facts in 
number theory that has not been proved to be correct in the 
general case. It has been numerically confirmed up to very large 
numbers. Write a function to find the two prime numbers that sum 
up to a given even integer.*)
exception Error of string;;
let makeintolistwitha h a=h::(a::[]);;
let rec extract2=function
  | [] -> []
  | h::t -> (map (makeintolistwitha h) t)@(extract2 t);;
let goldbach n=if (n mod 2)=0 then filter (fun x->sum(x)=n) 
              (extract2 (all_primes 2 n))
              else raise (Error "Not even");;
assert(goldbach(28)=[[5; 23]; [11; 17]]);;
(*41. A list of Goldbach compositions. Given a range of integers
 by its lower and upper limit, print a list of all even numbers
and their Goldbach composition. In most cases, if an even 
number is written as the sum of two prime numbers,
one of them is very small. Very rarely, the primes are both
bigger than say 50. Try to find out how many such cases there
are in the range 2..3000.*)
let get_evens start fin=(filter (fun x->x mod 2=0) (range start fin));;
let goldbach_list start fin=(map (fun x->(x, goldbach(x))) (get_evens start fin));;
assert(goldbach_list 9 20=[(10, [[3;7]]); (12, [[5;7]]); (14, [[3;11]]);
(16, [[3;13];[5;11]]);  (18,[[5;13];[7;11]]);  (20,[[3;17];[7;13]]);
]);;
