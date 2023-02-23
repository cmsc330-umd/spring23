let rec map f l = match l with
[] -> []
|h::t -> (f h)::(map f t);;

('a -> 'b) -> 'a list -> 'b list


let add3 x = x + 3 in 
map add3 [1;2;3]
4::5::6::[]

map add3 [1;2;3]
(int -> int) -> int list -> int list

map (fun a,b -> a + b) [(1,2);(3,4)]
(int*int -> int) -> int *int list -> int list

map (fun f -> f 3) [(fun x -> x + 1);(fun x -> x -2)];
((int->int) -> int) -> (int -> int) list -> int list

let rec foldl f a l = match l with
[] -> a
|h::t -> foldl f (f a h) t;;

('a -> 'b -> 'a)-> 'a -> 'b list -> 'a

the function is going take some value and update it with 
each item in the list
evaluates list left -> right

fold takes in a total value, a function, and a list
and updates the total with the function and each item in the list
and returns the total value

a::b vs a@b;;
a:'a :: b:'a list
a:'a list @ b:'a list


let rec foldl f a l = match l with
[] -> a
|h::t -> foldl f (f a h) t;;

let sum a b = a + b in 
foldl sum 0 [1;2;3]

match [1;2;3] with
[] -> 0
|h::t -> foldl sum 1 [2;3];;

foldl sum 1 [2;3]
match [2;3] with
[] -> 1
|h::t -> foldl sum 3 [3]

foldl sum 3 [3]
match [3] with
[] -> 3
|h::t -> fold sum 6 []

fold sum 6 []
match [] with
[] -> 6

let rec foldr f l a -= match l with
[] -> a
|h::t -> f h (foldr f t a)

foldr -> 3 + 2 + 1 -> 6
1 + 2 + 3 =  3 + 2 + 1
1 - 2 -3 != 3 - 2 - 1

foldl (fun (a,b) x -> (a+h,b+1)) (0,0) [1;2;3]

join
["a","b","c"].join -> "abc"

let joinf lst = foldl (fun a h -> a ^ h) "" lst

let rec join lst = match lst with 
[] -> ""
|h::t -> h ^ (join t);;

let rec join lst = 
let rec join2 lst a = match lst with
[] -> a
|h::t -> join2 t (h^a) in join2 lst;;

countif takes in a predicate and alist and counts how many items in the list make the predicate true

let countif pred lst = 
foldl 
  (fun a x -> if pred x then a+ 1 else a) 
  0 
  lst

 powerset of list return a list of all possible subsets

[1;2;3]
[[];[1];[2];[3];[1;2];[1;3];[2;3];[1;2;3]]

'a list -> 'a list list

let powerset lst = fold f [] lst

f: -> 'a -> 'a list list

let build acc ele = match acc with
[] -> [[ele]]
|h::t -> let res = map (fun x -> ele::x) acc
          in [ele]::(res @ acc);;

let powerset lst = []::lst::(fold build [] lst);;

powerset [1;2;3];;
        
build 1 [[2];[3]] -> [[1];[2];[3];[1;2];[1;3]]
res = map ... -> [[1;2];[1;3]]
temp = [1]::res -> [[1];[1;2];[2;3]]
temp @ [[2];[3]] -> [[1];[1;2];[2;3] [2];[3]]

fold is a the higher level idea of taking a value and a list and updating the total based off the items in the list

map takes in a list and a function. For each item in the list, call the function on it and get a result r back. Then add r to a list of other results

map (fun x -> x + 3) [1;2;3]
-> [4;5;6]
