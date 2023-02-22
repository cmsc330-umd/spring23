int things
  +, -, *, /
  (e1:int + e2:int):int

float things
  +., -., *., /.
  (e1:float +. e2:float ):float

string things
  (e1:string ^ e2:string):string
  
bool things
  &&, ||, !
  (e1:bool && e2:bool):bool

conditionals
  (if (e1:bool) then e2:'a else e2:'a):'a

let expressions
  (let x = e1:'a in x):'a
  (let x a1:'a a2:'b ...= e1:'tx in x):'a->'b->...->'ty
  (let x = e1:'a in e2:'b):'b

function calls
  (f x1 x2 ...)
  which has type:
  (f: 'a 'b ... -> 't x1:'a x2:'b ...):'t

list things
  ([e1:'a;e2:'a;...]):'a list
  (e1:'a :: e2:'a list):'a list

tuples
  ((e1:'a,e2:'b,...)):'a * 'b *...

pattern match
  (match e1:'a with
     p1 -> e1:'b
    |p2 -> e2:'b
    ...
    ):'b

constants
  1:int
  1.3:float
  true:bool
  "String":string
  (fun x -> x + x):int -> int

variants (not expression. Is a definition)
  (type x = A|B|...):x
  (type x = {var1:'a;var2:'b;...}:x

let bindings (not expressions, different than let expressions)
(let x = expr1:'t):'t;;
(let f x:'a y:'b ...  = expr1:'t) 'a -> 'b -> ... 't);;

let x = 5;;
x + 6;;

5 + 6

(fun a1 a2 a3... -> e)

let area l w = l*w;;


let area l w = l * w

let area = (fun l w -> l * w);;

let area = fun l -> (fun w -> l * w)

def genadd(x)
  Proc.new{|y| y + x}
end

add3 = gendadd(3)
add4 = gendadd(4)

add3.call(4)
add4.call(4)

let area = fun l -> (fun w -> l * w)

def area
  Proc.new{|l| Proc.new{|w| -> l * w}}
end

area.call(3).call(4)

def appplied(p,x)
  p.call(x)
end


let applied f x = f x;;


let rec map f l = match l with
[] -> []
|h::t -> (f h)::(map f t);;

('a -> 'b) -> 'a list -> 'b list

let add3 x = x + 3

map add3 [1;2;3]
match [1;2;3] with
[] -> []
h::t -> 4::5::6::[];;
[4;5;6]

map add3 []
match [] with
[] -> []
|h::t -> add3 h ....

map add3 [3]
match [3] with
[]-> []
|h::t -> 6::(map add3 [])
h:3
t:[]

map add3 [2;3]
match [2;3] with
[] -> []
|h::t -> (5::map add3 [3])

l: [2;3]
f:add3
h:2
t:[3]
