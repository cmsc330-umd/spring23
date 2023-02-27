type 'a tree = 
  | Leaf 
  | Node of 'a tree * 'a * 'a tree

let rec map f xs = 
  match xs with
      [] -> []
    | h::t -> (f h)::(map f t)

let rec fold f a lst =
    match lst with
    []->a
    |h::t->fold f (f a h) t

let rec fold_right f lst a =
    match lst with
    []->a
    |h::t-> f h (fold_right f t a)

let rec map_tree f t = match t with
| Leaf -> Leaf
| Node (left_tree, value, right_tree) -> 
  Node (map_tree f left_tree, f value, map_tree f right_tree)

let rec fold_tree f b t = match t with
| Leaf -> b
| Node(l, v, r) -> let res_l = fold_tree f b l in
let res_r = fold_tree f b r in f res_l v res_r

let add1 tree = failwith "unimplemented"

let sum tree = fold_tree (fun x l r -> x + l + r) 0 tree


Node of a tree * a * a tree