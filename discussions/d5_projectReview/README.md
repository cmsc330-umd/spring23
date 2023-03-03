# Discussion 5 - Friday, March 3<sup>rd</sup>

## Reminders
1. Quiz 2 is **today** March 3rd
2. Project 2b due March 12th 11:59PM
3. Exam 1 is coming up on March 14th

Today, we will be briefly discussing how to evaluate a subset of the `condition`s from Project 2b.

```ml
type condition = 
  | True
  | False
  | And of condition * condition
  | Or of condition * condition
  | Not of condition
  | If of condition * condition * condition
```
Notice how this definition is recursive. The “base cases” are True and False, and the other conditions have conditions within them. Some examples of conditions are:
- `Or(Not(True), False)`
- `And(Or(True, Not(False))), True)`
- `If(True, Or(True, False), And(False,Not(True)))`
- `If(And(True, True), Or(Not(False), True), False)`

To interpret these conditions, we can think of “unwrapping” the condition based on what type of condition it is. We can use pattern matching to implement this. 

```ml
let rec is_true condition = match condition with
  | True -> true
  | False -> false
  | And(x,y) -> (is_true x) && (is_true y)
  | Or(x,y) -> (is_true x) || (is_true y)
  | Not(x) -> not (is_true x)
  | If(x,y,z) -> if (is_true x) then (is_true y) else (is_true z)
```
