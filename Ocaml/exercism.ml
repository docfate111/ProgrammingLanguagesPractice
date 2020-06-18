(*The classical introductory exercise. 
Just say "Hello, World!"
print_string("Hello world!")*)
exception Error of string;;
let isLeapYr a=if a mod 4=0 then true else false;;
(*Given a year, report if it is a leap year.*)
assert(isLeapYr(2012)=true);;
assert(isLeapYr(2014)=false);;
(*Calculate the Hamming Distance between two DNA strands.*)
let list_of_string s = List.map (fun x->String.make 1 x) (List.init (String.length s) (String.get s));;
let rec string_of_list=function []-> ""
                      | hd::tl -> hd^string_of_list(tl);;
let rec ham a b=match (a, b) with
  | [], [] -> 0
  | (hd::tl), (hd'::tl') -> if hd=hd' then (ham tl tl')
                            else 1+(ham tl tl')
  | _, _ -> 0;;
assert((ham (list_of_string("GAGCCTACTAACGGGAT")) (list_of_string("CATCGTAATGACGGCCT")))=7);;
(*Convert a number to a string, the contents of which depend on the number's factors.
    If the number has 3 as a factor, output 'Pling'.
    If the number has 5 as a factor, output 'Plang'.
    If the number has 7 as a factor, output 'Plong'.
    If the number does not have 3, 5, or 7 as a factor, 
    just pass the number's digits straight through.
*)
let factorof n b s=if n mod b=0 then s else "";;
let fizzbuzz n=if(factorof n 3 "Pling")^(factorof n 5 "Plang")^(factorof n 7 "Plong")=""
                then string_of_int(n) else (factorof n 3 "Pling")^(factorof n 5 "Plang")^(factorof n 7 "Plong");;
assert(fizzbuzz(28)="Plong");;
assert(fizzbuzz(30)="PlingPlang");;
assert(fizzbuzz(34)="34");;
(*Find the difference between the square of the sum and the sum of the squares of 
the first N natural numbers.*)
let square n=n*n;;
let rec sum_square n=if n=1 then 1 else square(n)+sum_square(n-1);;
let rec sum n=if n=1 then 1 else n+sum(n-1);;
let diff_sqs n=square(sum(n))-sum_square(n);;
assert(diff_sqs(10)=2640);;
(*Given a DNA strand, its transcribed RNA strand is formed by 
replacing each nucleotide with its complement*)
let rec transcribe l=match l with
      | [] -> []
      | "G"::tl -> "C"::(transcribe tl)
      | "C"::tl -> "G"::(transcribe tl)
      | "T"::tl -> "A"::(transcribe tl)
      | "A"::tl -> "U"::(transcribe tl)
      | _::tl-> ""::(transcribe tl);;
assert(string_of_list(transcribe(list_of_string "AATCCGCTAG"))="UUAGGCGAUC");;
let count s n=List.length (List.filter (fun x->x=n) (list_of_string(s)));;
let dnaFreq s=(count s "A")::((count s "C")::((count s "G")::((count s "T")::[])));;
assert(dnaFreq("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")=[20;12;17;21]);;
