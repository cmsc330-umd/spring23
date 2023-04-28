# Discussion 11 - Friday, April 28<sup>th</sup>

## Reminders
* Project 4a and 4b due April 30th (extended deadline)
* Quiz 5 **next week** on May 5th in discussion

## What is Rust? 

Modern language designed for concurrency; it's similar to C++ and OCaml, but does it in a fast, type-safe, and thread-safe manner
* How does it achieve speed and safety? It avoids Garbage Collection, and instead uses rules for memory management 

	`let mut x = String::from("hello");` &lt;- Mutability

	`do_something(&mut x);` &lt;- Borrowing, avoids ownership change

	`println("{}",x);`

### Mutability

* Variables can either be declared as mutable (`mut`) or immutable
    * Similar to `const` in C
    * Mutable means the variable can be reassigned, e.g. `let mut x = 0; x = x + 5;`

### Ownership

#### Terms

* **Value**: Data stored in memory (Strings, ints, structs, etc...), values must always be owned by exactly one variable
* **Variable**: may own a value, or be a reference to a value
* **Scope**: The area where a `variable` is defined, usually from the `let` statement until end of its codeblock (`}`)
* **Lifetime**: The area where a `value` is defined, because `value`s can change owners, this is not always the same as the scope of the variable it was initally owned by


#### Rules

* Ownership is a technique used to automatically free variables
    * Each piece of data has a single owner(variable) at a time. When its owner goes out of scope, its value is dropped from memory
    * Ownership changes through two operations
        * Variable assignment
            * Ownership of the value transfers to the new variable, the old variable becomes invalid (no data)
            * Note that primitives like integers, booleans, etc. do not transfer ownership on assignment. Primitives implement the `Copy` trait, so their value can simply be copied to new variables
            * E.g. 
    
    			`let s1 = String::from("hello");` &lt;- s1 is owner
    
    			`let s2 = s1;` &lt;- Ownership is transferred from s1 to s2
    
    			`println!("{}",s1);` &lt;- Error, s1 is now invalid
    
        * Function call
            * When a variable is passed into a function, ownership is transferred to the function, so the variable is invalidated after the function is run
            * `let s1 = String::from("hello"); 	do_something(s1);`
            * Ownership was transferred from s1 to function parameter; s1 is now invalidated
     
### Borrowing/References

* We can use references to get around ownership issues
* Borrowing is similar to pointers in C, two types
    * Mutable ref, `&mut` - Can edit variable, only for mutable variables, only one may exist at any point in time
    * Immutable ref, `&` - Can't edit
* Allows us to pass in references to functions, preventing ownership from going out of scope
* Also used for things like iteration; when looping through list, get a series of references to elements in list
* One limitation: Can only either have `1 mutable ref` or `many immutable refs` at any given time
    * This prevents weird write errors
* Exemplified by String class; `&str` is a read-only pointer to String, whereas String class is similar to array of chars

Example with .iter(): 

```ocaml
let mut arr = [1,2,3];
for &i in arr.iter() {
	println!("{}",i);
}
```

    

What does this mean when you write programs? 


1. Make sure you know which variables are mutable and immutable
2. Be aware of who owns certain variables, and pass around references to make sure ownership doesn't go out

Some common errors are


1. Variable mutability
2. Using variable after it goes out of scope
3. Passing in regular variable instead of reference
4. Failing to return correct value from function
5. Incorrect types (reference when regular variables should be used, etc.)

## Debugging Problems 

Each of the functions in error.rs has an error; fix the error

Solutions in correct.rs
