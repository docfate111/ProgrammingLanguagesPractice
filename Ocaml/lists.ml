open List;;
(*** 1. Write a function
 last : 'a list -> 'a option that returns the last element of 
 a list. (easy)***)
let rec last l= if length(l)=0
              then None
              else
              if length(l)<2 
              then Some(hd(l))
              else last(tl(l));;
let intOption2int=function None->0 | Some n -> n;;
let strOption2str=function None->" "| Some n -> n;;
assert(strOption2str(last(["a";"b";"c";"d"]))="d");;
assert(intOption2int(last([1;2;3;4]))=4);;
assert(intOption2int(last([]))=0);;
assert(last([])=None);;
(***2. Find the last but one (last and penultimate) elements of a
 list.
***)
let rec last_two l=if length(l)<=2
                    then l
                    else
                    last_two(tl(l));;
let rec print_list = function 
    [] -> ()
    | e::l -> print_string e ; print_string " " ; print_list l;;
assert(last_two(["a";"b";"c";"d"])=["c";"d"]);;
assert(last_two([ "a" ])=["a"]);;
(*** 3. Find the k'th element of a list. ***)
let rec at i=function
    | [] -> None
    | h :: t -> if i=1
                then Some(h)
                else at (i-1) t;;
assert(at 3 [ "a" ; "b"; "c"; "d"; "e" ]=Some "c");;
assert(at 3 ["a"]=None);;
(*4. Find the number of elements of a list.*)
let rec length=function
      | [] -> 0
      | h :: t -> 1+length(t);;
assert(length([ "a" ; "b" ; "c"])=3);;
assert(length([])=0);;
let rec print_listi = function 
    [] -> ()
    | e::l -> print_int e ; print_string " " ; print_listi l;;
(*5. Reverse a list. *)
let rev list =
  let rec aux acc = function
    | [] -> acc
    | h::t -> aux (h::acc) t in
  aux [] list;;
assert (rev [1;2;3]=[3;2;1]);;
assert (rev ["a";"b";"c"]=["c";"b";"a"]);;
(*6. Find out whether a list is a palindrome. *)
let is_palindrome l=(rev l)=l;;
assert(is_palindrome [ "x" ; "a" ; "m" ; "a" ; "x" ]);;
assert( not (is_palindrome [ "a" ; "b" ]));;
(*7. Flatten a nested list structure. *)
type 'a node =
  | One of 'a 
  | Many of 'a node list;;
let flatten l=
  let rec aux acc=function 
    | [] -> acc
    | One o :: t -> aux (o::acc) t
    | Many l :: t -> aux (aux acc l) t
  in rev(aux [] l);;
assert(flatten([ One "a" ; Many [ One "b" ; Many [One "c";One "d"]; One "e"]])=["a"; "b"; "c"; "d"; "e"]);;
(*8. Eliminate consecutive duplicates of list elements. *)
let rec compress=function
    | [] -> []
    | [x] -> [x]
    | h::t -> if h=hd(t) then
              compress t
              else
              cons h (compress t);;
assert(compress(["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"])=["a"; "b"; "c"; "a"; "d"; "e"]);;
(*9. Pack consecutive duplicates of list elements into sublists. *)
let pack l=
  let rec aux acc tot=function 
    | [] -> []
    | [x] -> (x :: acc) :: tot
    | h :: t -> if h=hd(t) then
              aux (h :: acc) tot t
              else  aux [] ((h::acc)::tot) t
  in rev(aux [] [] l);;
(*assert pack(["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"d";"e";"e";"e";"e"])=
[["a"; "a"; "a"; "a"]; ["b"]; ["c"; "c"]; ["a"; "a"]; ["d"; "d"];
 ["e"; "e"; "e"; "e"]]*)
 (*10. Run-length encoding of a list.*)
 let encode l=
  let rec aux count curr=function 
    | [] -> []
    | [x] -> (count+1, x)::curr
    | h :: t -> if h=hd(t) then
              aux (count+1) curr t
              else  aux 0 ((count+1, h)::curr) t
  in rev(aux 0 [] l);;
  assert(encode(["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"])=[(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")]);;
(*11. Modified run-length encoding. (easy)
Modify the result of the previous problem in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.
Since OCaml lists are homogeneous, one needs to define a type to hold both single elements and sub-lists.*)
  type 'a rle =
  | One of 'a
  | Many of int * 'a;;
  let encode2 l=
    let create_tuple count e=
      if count=1 then One e
      else Many (count, e) in 
    let rec aux count curr=function 
      | [] -> []
      | [x] -> (create_tuple (count+1) x)::curr
      | h :: t -> if h=hd(t) then
                    aux (count+1) curr t
                  else 
                    aux 0 ((create_tuple (count+1) h)::curr) t
    in rev(aux 0 [] l);;
(*12. Decode a run-length encoded list. *)
let rec expand acc n s=
  if n<0 then tl(acc) else expand (s::acc) (n-1) s;;
let unfold=function
   | One a -> [a]
   | Many (n, s) -> expand [] n s;;
let rec decode=function
    | [] -> []
    | h::t -> unfold(h)@decode(t);;
assert(decode([Many (4,"a"); One "b"; Many (2,"c"); Many (2,"a"); One "d"; Many (4,"e")])=["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]);;
(* Skipping 13 since its the same as 11
14. Duplicate elements of a list*)
let rec duplicate=function
  | [] -> []
  | h::t -> h::(h::duplicate(t));;
assert(duplicate(["a";"b";"c";"c";"d"])=
["a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"; "d"; "d"]);;
(*15. Replicate elements of a list a given number of times*)
let rec replicate n=function 
    | [] -> []
    | h::t -> (expand [] n h)@(replicate n t);;
assert(replicate 3 ["a";"b";"c"]=["a"; "a"; "a"; "b"; "b"; "b"; "c"; "c"; "c"]);;
(*16. Drop every N'th element from a list*)
let rec dropn n count=function 
    | [] -> []
    | h::t -> if count mod n=0 then
              dropn n (count+1) t
              else h::(dropn n (count+1) t);;
let drop l n=dropn n 1 l;;
assert(drop["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 3=["a"; "b"; "d"; "e"; "g"; "h"; "j"]);;
(*17. Split a list into two parts; the length of the first part is given.*)
let rec splitn n acc=function 
    | [] -> rev(acc), []
    | h::t as l-> if n=0 then rev(acc), l
              else splitn (n-1) (h::acc) t;;
let split l n=splitn n [] l;;
assert(split ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 3=(["a"; "b"; "c"], ["d"; "e"; "f"; "g"; "h"; "i"; "j"]));;
assert(split ["a";"b";"c";"d"] 5=(["a"; "b"; "c"; "d"], []));;
(*18. Extract a slice from a list.*)
let rec slicen start fin count=function 
    | [] -> []
    | h::t -> if (count>=start && count<=fin) then
              h::(slicen start fin (count+1) t)
              else slicen start fin (count+1) t
let slice l start fin=slicen start fin 0 l;;
assert(slice ["a";"b";"c";"d";"e";"f";"g";"h";"i";"j"] 2 6=["c"; "d"; "e"; "f"; "g"]);;
(*19. Rotate a list N places to the left. *)
let rotaten n count=function 
    | [] -> []
    | h::t as l-> (slice l ((n+length(l))mod length(l)) (length(l)))@(slice l 0 ((n-1+length(l)) mod length(l)));;
let rotate l n=rotaten n 0 l;;
assert(rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3=["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]);;
assert(rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] (-2)=["g"; "h"; "a"; "b"; "c"; "d"; "e"; "f"]
);;
(*20. Remove the K'th element from a list.*)
let rec remove_atn n count=function 
    | [] -> []
    | h::t -> if n=count then
              remove_atn n (count+1) t
              else h::(remove_atn n (count+1) t);;
let remove_at n l=remove_atn n 0 l;;
assert(remove_at 1 ["a";"b";"c";"d"]=["a"; "c"; "d"]);;
let rec insert_atn s n count=function 
    | [] -> []
    | h::t -> if n=count then
              h::(s::(insert_atn s n (count+1) t))
              else h::(insert_atn s n (count+1) t);;
let insert_at (s:string) (n:int) l=insert_atn s n 1 l;;
(*print_list(insert_at "alfa" 1 ["a";"b";"c";"d"]);;*)
assert(insert_at "alfa" 1 ["a";"b";"c";"d"]=["a"; "alfa"; "b"; "c"; "d"]);;
assert(insert_at "alfa" 3 ["a";"b";"c";"d"]=["a"; "b"; "c"; "alfa"; "d"]);;
assert(insert_at "alfa" 4 ["a";"b";"c";"d"]=["a"; "b"; "c"; "d"; "alfa"]);;
let rec rangeup start fin=if start=fin then [start] 
                          else start::(rangeup (start+1) fin);;
let range start fin=if start>fin then
                    rev(rangeup fin start)
                    else rangeup start fin;;
assert(range 4 9 = [4; 5; 6; 7; 8; 9]);;
assert(range 9 4= [9; 8; 7; 6; 5; 4]);;
(*23. Extract a given number of randomly selected elements from a 
list.*)
Random.init 1;;
let rec randomchoose count n l=if count=n then []
                                else 
                                (nth l (Random.int (length(l))))::(randomchoose (count+1) n l);;
let rand_select l n=randomchoose 0 n l;;
(*print_list(rand_select ["a";"b";"c";"d";"e";"f";"g";"h"] 3);;*)
(*24. Lotto: Draw N different random numbers from the set 1..M.*)
let lotto_select n num=randomchoose 0 n (range 0 num);;
(*print_listi(lotto_select 6 49);;*)
(*25. Generate a random permutation of the elements of a list.*)
(*1. Generate list of indeces: range 0 length(l)
  2. Choose random index and remove it from the list 
  and concatenate to list
  3. When list is empty done
let possindeces l=range 0 (length(l));;
let rec permutate acc=function
    | [] -> []
    | h::t -> let x=randomchoose 0 n acc;
              x::
let permutation l=permutate (possindeces l) l;;*)
let rec choosenoreplacen count n l=if count=n then [] else 
let x=Random.int (length(l)) in (nth l x)::(choosenoreplacen (count+1) n (remove_at x l));;
let permutation l=choosenoreplacen 0 (length(l)) l;;
(*print_list(permutation ["a"; "b"; "c"; "d"; "e"; "f"]);;
= ["a"; "e"; "f"; "b"; "d"; "c"]*)
(*26. Generate the combinations of K distinct objects chosen from 
the N elements of a list.*)
let makeintolistwitha h a=h::(a::[]);;
let rec extract2=function
  | [] -> []
  | h::t -> (map (makeintolistwitha h) t)@(extract2 t);;
assert(extract2 ["a";"b";"c";"d"]=[["a"; "b"]; ["a"; "c"]; ["a"; "d"]; ["b"; "c"]; ["b"; "d"]; ["c"; "d"]]);;
let rec extract k list =
  if k <= 0 then [ [] ]
  else match list with
       | [] -> []
       | h :: tl ->
          let with_h = List.map (fun l -> h :: l) (extract (k-1) tl) in
          let without_h = extract k tl in
          with_h @ without_h;;
assert(extract 2 ["a";"b";"c";"d"]=[["a"; "b"]; ["a"; "c"]; ["a"; "d"]; ["b"; "c"]; ["b"; "d"]; ["c"; "d"]]);;
let rec extractn k list =
  if k <= 0 then [ [] ]
  else match list with
       | [] -> []
       | h :: tl ->
          let with_h = List.map (fun l -> h :: l) (extractn (k-1) tl) in
          let without_h = extractn k tl in
          with_h @ without_h;;
(*28. Sorting a list of lists according to length of sublists.*)
let comparelen a b=if length(a)>length(b) then 1
                    else if length(a)=length(b) then 0
                    else -1;;
let length_sort l=sort comparelen l;;
assert(length_sort [[ "a";"b";"c"]; ["d";"e"]; ["f";"g";"h"]; 
  ["d";"e"]; ["i";"j";"k";"l"]; ["m";"n"]; ["o"]]=[["o"]; ["d"; "e"]; ["d"; "e"]; ["m"; "n"]; ["a"; "b"; "c"]; ["f"; "g"; "h"];
  ["i"; "j"; "k"; "l"]]);;
let lengthfreq e l=length (filter (fun x->(length(x))=(length(e))) l);;
let comparelenfreq l a b=if (lengthfreq a l)>(lengthfreq b l) then 1
else if (lengthfreq a l)=(lengthfreq b l) then 0
else -1;;
let frequency_sort l=sort (comparelenfreq l) l;;
assert(frequency_sort(
[["a";"b";"c"];["d";"e"];["f";"g";"h"];["d";"e"];
["i";"j";"k";"l"]; ["m";"n"]; ["o"]])=
[["i"; "j"; "k"; "l"]; 
["o"];["a"; "b"; "c"];["f"; "g"; "h"];["d"; "e"];
["d"; "e"];["m"; "n"]]);;




