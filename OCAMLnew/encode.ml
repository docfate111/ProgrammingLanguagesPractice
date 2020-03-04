(*49. Gray code. 
An n-bit Gray code is a sequence of n-bit strings constructed 
according to certain rules. 
For example,
n = 1: C(1) = ['0','1'].
n = 2: C(2) = ['00','01','11','10'].
n = 3: C(3) = ['000','001','011','010',´110´,´111´,´101´,´100´].
Find out the construction rules and write a function with the
 following specification: gray n returns the n-bit Gray code.*)
let join (a:string) (b:string)=String.concat a (""::(b::[]));;
let rec grayn n c lst=if n=1 then lst else
(List.map (join (List.hd(c))) (grayn (n-1) c lst))@
(List.map (join (List.hd(List.tl(c)))) (List.rev (grayn (n-1) c lst)));;
let gray n=grayn n ["0";"1"] ["0";"1"];;
assert(gray 1=["0"; "1"]);;
assert(gray 2=["00"; "01"; "11"; "10"]);;
assert(gray 3=["000"; "001"; "011"; "010"; "110"; "111"; "101"; "100"])
(*50. Huffman code
We consider a set of symbols with their frequencies. 
For example, if the alphabet is "a",..., "f" 
(represented as the positions 0,...5) and respective 
frequencies are 45, 13, 12, 16, 9, 5:
# let fs = [ ("a", 45); ("b", 13); ("c", 12); ("d", 16);
             ("e", 9); ("f", 5) ];;
Our objective is to construct the Huffman code c word for all symbols. 
In our example, the result could be hs = [("a", "0"); ("b", "101");
  "c", "100"); ("d", "111"); ("e", "1101"); ("f", "1100")]
(or hs = [ ("a", "1");...]). The task shall be performed by the 
  function huffman defined as follows: huffman(fs) returns the Huffman 
code table for the frequency table fs)
1. sort by letter frequency 
2. make binary heap starting with least frequent at the bottom
3. read out the binary 0 for left 1 for right
*)
type tree=
  | Parent of tree*tree
  | Nokids;;
let second (_, t)=t;;
(*I don't think this is necessary?
let comparelen a b=if secondlet rec insertNode parent n=match parent with
| (Node(b, l, r)) -> if n=b then parent else
                    if n<b then Node(b, (insertNode l n), r)
                    else Node(b, l, (insertNode r n))
| Empty -> Node(n, Empty, Empty);; let f_sort l=List.sort comparelen l;;*)
let construct l=List.fold_left insertNode Empty l;;(a)>second(b) then 1
                    else if second(a)=second(b) then 0
                    else -1;;


(*TODO: Number 50 after trees*)