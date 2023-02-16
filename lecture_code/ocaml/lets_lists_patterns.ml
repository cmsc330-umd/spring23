(let var = e1:t1 in e2:t2):t2

let x = 3 in x + 4;;
var: x
e1: 3
t1:int
e2:x+4
t2:int

1. e1 is evaluated to a value, v1
2. bind v1 to the varaible var, v1:var
3. evaluate e2 knowing {v1:var} to a value v2
4. return v2

let x = 3 in 4
3=>3
3:x
4 knowing 3:x => 4
4


(let var = e1:t1 in e2:t2):t2

1. e1 is evaluated to a value, v1
2. bind v1 to the varaible var, v1:var
3. evaluate e2 knowing {v1:var} to a value v2
4. return v2

let x = 3 in let x = 4 in x + x
let x = 3 in z
let x = 3 in 8
z = let x = 4 in x + x => 8


e1:3=>3
t1:int {x:3}
e2: let x = 4 in x + x
t2:int

subexpr-e2 {3:x}
  let x = 4 in x + x
  e1: 4+.4
  t1: int {4:x}
  e2: x + x => 4 + 4 => 8
  t2: int
:int

let x = let x = 3 in x + 1 in x + 2;;
e1: let x = 3 in x + 1 => 4
e2: x + 2 {4:x} => 6

let x = 4 in let x = x + 4 in x;;
let x = 4 in let y = x + 4 in y;;

def area r
  pi = 3.14
  return pi * r * r
end

let area r = let pi = 3.14 in pi *. r *. r;;

([e1:t;e2:t;...;ex:t]):t list

(e1:t :: e2:t list):t list

a.push(x)
x::a

1::[2]

1::(2::[3])

list :-
  []
  h::t
  h: the head or first item
  t: the rest of the list



0-> 1 -> 2 -> 3 -> 4

lst = 1mem

let lst2 = 0:: lst

(match e1:t with
p1 -> e2:t2
|p2 -> e3:t2
...
|px -> ex:t2):t2

match e1 with p1 -> e2 | p2 -> e3 | px -> px;;

[1] -> 1::[], h:1, t:[]
[1;2;3;4] -> h:1, t:[2;3;4]

(match e1:t with
p1 -> e2:t2
|p1 -> e3:t2
...
|px -> ex:t2):t2

switch(3)
  case(4): return 7
  case(5): return 6
  case("hello"): return 8

let x = 5 in 

let _ = print_int 
(let x = [1;2;3] => 1::(2::3[])
in match x with
[] -> 0
|h::2::t -> h
) 

let length lst = match lst with
[] -> 0
|h::t -> 1 + length t;;


let rec evens lst = match lst with
[] -> []
|h::t -> if h mod 2 = 0 then h::(evens t) else evens t;;
