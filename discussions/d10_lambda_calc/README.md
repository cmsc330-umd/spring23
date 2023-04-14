# Discussion 10 - Friday, April 14<sup>th</sup>

## Reminders
* Quiz 4 is **today**
* Exam 2 is on April 20th
* Project 4a/4b **deadline extended** to April 30th (10% extra credit if you submit by initial due date of April 23rd)

## Lambda Calculus

### Call by Value
"eager evaluation" </br>
before doing a beta reduction, we make sure the argument cannot, itself, be further evaluated

(λz. z) ((λy. y) x) → (λz. z) x → x

### Call by Name
"lazy evaluation" </br>
we can specifically choose to perform beta-reduction *before* we evaluate the argument

(λz. z) ((λy. y) x) → (λy. y) x → x


### Exercises

1) (λa. a) b

**Make the parentheses explicit in the following expressions:**

2) a b c

3) λa. λb. c b

4) λa. a b λa. a b

**Identify the free variables in the following expressions:**

5) λa. a b a

6) a (λa. a) a

7) λa. (λb. a b) a b

**Apply alpha-conversions to the following:**

8) λa. λa. a

9) (λa. a) a b

10) (λa. (λa. (λa. a) a) a)

**Apply beta-reductions to the following:**

11) (λa. a b) x b

12) (λa. b) (λa. λb. λc. a b c)

13) (λa. a a) (λa. a a)
