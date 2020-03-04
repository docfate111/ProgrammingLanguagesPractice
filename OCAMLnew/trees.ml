type 'a binary_tree =
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree;;
let example_tree =
    Node('a', Node('b', Node('d', Empty, Empty), Node('e', Empty, Empty)),
         Node('c', Empty, Node('f', Node('g', Empty, Empty), Empty)));;
  let example_tree2 =
          Node('b', Node('b', Node('n', Empty, Empty), Node('e', Empty, Empty)),
               Node('k', Empty, Node('m', Node('g', Empty, Empty), Empty)));;
  let example_int_tree =
          Node(1, Node(2, Node(4, Empty, Empty), Node(5, Empty, Empty)),
               Node(3, Empty, Node(6, Node(7, Empty, Empty), Empty)));;
(*55. TODO: Construct completely balanced binary trees. In a 
completely balanced binary tree, the following property 
holds for every node: The number of nodes in its left 
subtree and the number of nodes in its right subtree are 
almost equal, which means their difference is not greater 
than one. Write a function cbal_tree to construct
completely balanced binary trees for a given number of nodes.
 The function should generate all solutions via backtracking.
Put the letter 'x' as information into all nodes of the tree.
let rec n_minus1node_tree n=if n=2 then Empty 
else Node('x', (cbal_tree (n-1)), (cbal_tree (n-1)));;
let rec insertNode N t=*)

(*56. Symmetric binary trees. Let us call a binary tree 
symmetric if you can draw a vertical line through the root 
node and then the right subtree is the mirror image of the
left subtree. Write a function is_symmetric to check whether
a given binary tree is symmetric. Hint: Write a function 
is_mirror first to check whether one tree is the mirror 
image of another. We are only interested in the structure,
not in the contents of the nodes.
*)
let rec is_mirror t1 t2=match t1, t2 with
    | Empty, Empty -> true
    | Node(_, x1, y1), Node(_, x2, y2) -> (is_mirror x1 x2) && (is_mirror y1 y2)
    | _ -> false;;
assert(is_mirror (Node(3, Empty, Node(4, Empty, Empty))) (Node(7, Empty, Node(10, Empty, Empty))));;
assert(not(is_mirror (Node(3, Empty, Node(4, Empty, Empty))) (Node(7, Empty, Node(10, Node(3, Empty, Empty),
Empty)))));;
let is_symmetric t=match t with
    | Empty -> true
    | Node(_, Empty, Empty) -> true
    | Node(_, x, y) -> is_mirror x y;;
assert(is_symmetric(Node('r', example_tree, example_tree2)));;
(*57. Binary search trees (dictionaries).
Construct a binary search tree from a list of integer numbers.*)
let rec insertNode parent n=match parent with
    | (Node(b, l, r)) -> if n=b then parent else
                        if n<b then Node(b, (insertNode l n), r)
                        else Node(b, l, (insertNode r n))
    | Empty -> Node(n, Empty, Empty);;
let construct l=List.fold_left insertNode Empty l;;
assert(construct([3;2;5;7;1])=Node (3, Node (2, Node (1, Empty, Empty), Empty),
Node (5, Empty, Node (7, Empty, Empty))));;
assert(is_symmetric(construct [5;3;18;1;4;12;21]));;
assert(not(is_symmetric(construct [3;2;5;7;4])));;
(*58. Generate-and-test paradigm. 
Apply the generate-and-test paradigm to 
construct all symmetric, completely balanced binary trees with a 
given number of nodes.
let sym_cbal_trees n=List.filter is_symmetric (cbal_tree n);;
assert(sym_cbal_trees 5=[Node ('x', Node ('x', Node ('x', Empty, Empty), Empty),
Node ('x', Empty, Node ('x', Empty, Empty))); Node ('x', Node ('x', Empty, Node ('x', Empty, Empty)), Node ('x', Node ('x', Empty, Empty), Empty))]);;
*)
(*Count the leaves of a binary tree. A leaf is a node with no successors.
 Write a function count_leaves to count them.*)
 let rec count_leaves parent=match parent with
      | Empty -> 0
      | Node(_, l, r) -> if(l=Empty && r=Empty) then 1 else
      (count_leaves l)+(count_leaves r);;
assert(count_leaves(Empty)=0);;
assert(count_leaves(example_tree)=3);;
(*61A. Collect the leaves of a binary tree in a list. A leaf is a node
 with no successors. Write a function leaves to collect them in a list.*)
 let rec leaves parent=match parent with
 | Empty -> []
 | Node(a, l, r) -> if(l=Empty && r=Empty) then [a] else
 (leaves l)@(leaves r);;
assert(leaves(example_tree)=['d'; 'e'; 'g']);;
assert(leaves(Empty)=[]);;
(*62. Collect the internal nodes of a binary tree in a list. An internal
 node of a binary tree has either one or two non-empty successors. 
 Write a function internals to collect them in a list.*)
 let rec internals parent=match parent with
 | Empty -> []
 | Node(a, Empty, Empty) -> []
 | Node(a, l, r) -> [a]@((internals l)@(internals r));;
 assert(internals (Node('a', Empty, Empty))=[]);;
 assert(internals(example_tree)=['a';'b';'c';'f']);;
 (*62B. Collect the nodes at a given level in a list. A node of a binary tree is 
 at level N if the path from the root to the node has length N-1. 
 The root node is at level 1. Write a function at_level t l to collect all nodes of
  the tree t at level l in a list.*)
  let rec at_leveln tree n current=match tree with 
    | Node(x, l, r) -> if n=current then x::((at_leveln l n (current+1))@(at_leveln r n (current+1))) 
                      else (at_leveln l n (current+1))@(at_leveln r n (current+1))
    | Empty -> [];;
let at_level tree n=at_leveln tree n 1;;
assert(at_level example_tree 2=['b';'c']);;
assert(at_level example_tree 5=[]);;
(*63. Construct a complete binary tree.
We can assign an address number to each node in a complete binary tree by 
enumerating the nodes in levelorder, starting at the root with number 1. 
In doing so, we realize that for every node X with address A the following 
property holds: The address of X's left and right successors are 2*A and 2*A+1, 
respectively, supposed the successors do exist. This fact can be used to elegantly
 construct a complete binary tree structure. Write a function 
 is_complete_binary_tree with the following specification:
  is_complete_binary_tree n t returns true iff t is a complete binary tree 
  with n nodes.
let list2tree l=Node(List.hd(l), Empty, Empty);;
let levelorderinsert tree node=function match tree with
    | Node(a, l, r) ->if l=Empty then l=node  
                      else if r=Empty then r=node
                      else if  


let complete_binary_tree=levelorderinsert [] (list2tree l) (map (fun x->Node(x, Empty, Empty)) List.tl(l));;*)
(*67. A string representation of binary trees. Somebody represents binary trees as 
strings of the following type (see example): "a(b(d,e),c(,f(g,)))". Write an OCaml
function string_of_tree which generates this string representation, if the tree is
given as usual (as Empty or Node(x,l,r) term). Then write a function tree_of_string
which does this inverse; i.e. given the string representation, construct the tree 
in the usual form. Finally, combine the two predicates in a single function
tree_string which can be used in both directions.
Write the same predicate tree_string using difference lists and a single predicate
tree_dlist which does the conversion between a tree and a difference list in both
 directions. For simplicity, suppose the information in the nodes is a single letter
  and there are no spaces in the string.*)
let rec string_of_tree tree=match tree with 
    | Empty -> ""
    | Node(a, l, r) -> match l,r with
              | Empty, Empty -> (Char.escaped a)
              | _, _ -> (Char.escaped a) ^ "("^(string_of_tree(l))^","^(string_of_tree(r))^")";;
let example_layout_tree =
    let leaf x = Node (x, Empty, Empty) in
      Node('a', Node('b', leaf 'd', leaf 'e'),
      Node('c', Empty, Node('f', leaf 'g', Empty)));;
assert(string_of_tree(example_layout_tree)="a(b(d,e),c(,f(g,)))");;