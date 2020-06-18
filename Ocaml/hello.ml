(***print_string "Hello world!"
***)
let my_fun(i, s, b)=
  if i>10 then print_int i
  else
    if s="test" then print_string s
    else
      if b then print_string "true"
;;
let secondo3 (a,b,c)=b;;
(***print_string(secondo3(10, "test", false));;***)
let int2month (i:int)=
  match i with 
  1 -> "Jan"
  | 2 -> "Feb"
  | 3 -> "Mar"
  | 4 -> "Apr"
  | 5 -> "May"
  | 6 -> "Jun"
  | 7 -> "Jul"
  | 8 -> "Aug"
  | _ -> "Other";;
(***print_string(int2month(3));;***)
let memo=Hashtbl.create 1;;
let rec fibo (i:int)=
  match i with 
  0 -> 1
  | 1 -> 1
  | _ -> 
  if Hashtbl.mem memo i
  then Hashtbl.find memo i
  else
  begin
  Hashtbl.add memo i (fibo(i-1)+fibo(i-2));
  Hashtbl.find memo i;
  end;;
for i=0 to 20 do
  print_int(fibo(i));
  print_string("\n");
done;;
