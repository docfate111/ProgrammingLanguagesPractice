open Str;;
open String;;
(*language: number, +, -, *, /  *)
type token=
    Tok_Num of string
  | Tok_Add 
  | Tok_Sub
  | Tok_Mul
  | Tok_Div
  | Tok_End 
  | Tok_LPar
  | Tok_RPar;;
(*included to get regular expressions: *)
#load "str.cma";;
let re_num=regexp "[0-9]";;
let re_add=regexp "+";;
let re_sub=regexp "-";;
let re_mul=regexp "*";;
let re_div=regexp "/";;
let re_lpar=regexp "(";;
let re_rpar=regexp ")";;
let re_space=regexp " ";;
let re_tab=regexp "\t";;
let re_nl=regexp "\n";;
exception Error of string;;
(*lexer(lexical analyzer-creates tokens for parser*)
let rec findIndexOfNext s pos=
    if pos>=length(s) then -1
    else
    match s.[pos] with
    ' ' -> pos
    | '(' ->  pos
    | ')' -> pos
    | _ -> findIndexOfNext s (pos+1);;
let tokenizer str=
    let rec tok pos s=
      (*if given a string and position is outside string then stop*)
      if pos>=length(s) then [Tok_End]
      else
        (*if at index pos the string matches anything in the re_num regular expression
        then*)
        if(string_match re_num s pos) then
            (*get first regular expression matched character in s and 
            recur for the whole string*)
            let nextIndex=findIndexOfNext s pos in
            if (nextIndex>=0)&&((nextIndex-pos)<length(s)) then
            (Tok_Num (sub s pos (nextIndex-pos)))::(tok (nextIndex) s)
            else (Tok_Num (sub s pos (length(s)-pos)))::(tok (length(s)) s)
        else 
        if(string_match re_add s pos) then
            (*same for finding all operations*)
          (Tok_Add)::(tok (pos+1) s)
        else
        if(string_match re_lpar s pos) then
          (Tok_LPar)::(tok (pos+1) s)
        else
        if(string_match re_rpar s pos) then
          (Tok_RPar)::(tok (pos+1) s)
        else
        if(string_match re_add s pos) then
          (Tok_RPar)::(tok (pos+1) s)
        else
        if(string_match re_sub s pos) then
            (*same for finding all operations*)
          (Tok_Sub)::(tok (pos+1) s)
        else
        if(string_match re_mul s pos) then
            (*same for finding all operations*)
          (Tok_Mul)::(tok (pos+1) s)
        else
        if(string_match re_div s pos) then
            (*same for finding all operations*)
          (Tok_Div)::(tok (pos+1) s)
        else
        if(((string_match re_tab s pos)||(string_match re_space s pos))||((string_match re_nl s pos))) then
          tok (pos+1) s
        else
          raise (Error "tokenizer")
        in tok 0 str;;
type expr=
    Num of int
    | Sum of expr * expr
    | Prod of expr * expr
    | Diff of expr * expr
    | Quot of expr * expr
    | Empty;;
(*parser turn those tokens into an AST!
grammar   <expr> ->  <op> <expr> <number> | <op> <number> <expr> |  <number> | <op> <number> <number>
          <op> -> [+-*/]
          <number> -> [0-9]
          terminating symbols: 'blank' | <number> | <op>
implement parser 
*)
let tok_list=ref [];;
let nextTok ()=match !tok_list with 
      [] -> raise (Error "parse error")
      | h::t -> h;;
(*if the token matches remove it from the list*)
let matchTok a=match !tok_list with
      h::t -> if h=a then tok_list := t
              else raise (Error "parse error");;
let rec  parse_expr ()=let t=nextTok() in match t with
                      | Tok_LPar -> matchTok Tok_LPar;
                        let n=nextTok() in opMatch(n)
                      | Tok_RPar -> matchTok Tok_RPar;
                        let n=nextTok() in theEnd(n)
                      | _ -> opMatch(t)
and parse_num ()=let t=nextTok() in match t with
              | Tok_LPar -> parse_expr()
              | Tok_Num s-> matchTok (Tok_Num s);
                            Num(int_of_string(s))
              | Tok_RPar -> matchTok Tok_RPar;
                            let n=nextTok() in
                            theEnd(n)
              | _ -> raise (Error "Parse error")
and opMatch s=match s with
              Tok_Add -> matchTok Tok_Add;
                  Sum(parse_num(), parse_num())
              | Tok_Sub -> matchTok Tok_Sub;
                  Diff(parse_num(), parse_num())
              | Tok_Mul -> matchTok Tok_Mul;
                  Prod(parse_num(), parse_num())
              | Tok_Div -> matchTok Tok_Div;
                  Quot(parse_num(), parse_num())
              | Tok_Num n -> parse_num()
              | _ -> raise (Error "Parse error")
and theEnd n=match n with
      Tok_Num s->parse_num()
      | Tok_End -> matchTok Tok_End;
                    Empty
      | _ -> parse_expr();;
let rec eval ast=match ast with
    Num a -> a
    | Sum(a, b) -> eval(a) + eval(b)
    | Diff(a, b) -> eval(b) - eval(a)
    | Prod(a, b) -> eval(a) * eval(b)
    | Quot(a, b) -> eval(b) / eval(a)
    | _ -> 1;;
let streval ast=string_of_int(eval(ast));;
let rep s=tok_list:=tokenizer(s);
          streval(parse_expr());;
(* REPL loop *)
let rec b()=print_string "lithp>";
          let st=read_line() in
          (if st="quit" then (exit 0) else
          print_endline (rep st));
          b();;
b();;