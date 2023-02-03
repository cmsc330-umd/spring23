# Discussion 1 - Friday, February 3<sup>rd</sup>

## Reminders
1. Project 1a due Sunday, February 5th 11:59PM
2. Quiz 1 next Friday, February 10th **in discussion**

## Code Blocks

A code block is like a special kind of method. They allow you to package code and pass it in as a variable. The fundamental idea is passing code as data.
```rb
{ |y| x = y + 1; puts x }
```
is almost the same as
```rb
def m(y)
  x = y + 1
  puts x
end
```
This is called **higher-order programming**. In other words, methods take other (almost-)methods as arguments.

### `each`
Code blocks in the `each` method do not modify the array.
```rb
a = [1,2]
a.each { |x| x = x*x }
puts a[1] 
# outputs 2, NOT 4 
```

### `find`
This method returns the first element `a` for which the code block returns true.
```rb
[1, 2, 3, 4, 5].find { |y| y % 2 == 0 }
# returns 2
```

### `collect`
The method applies the given code block to each element of an array and returns a new array.
Using `collect!` modifies the array.
```rb
[5, 4, 3].collect { |x| -x }
# returns [-5, -4, 3]
```

## Code Block Exercises

1. Create a code block to calculate the sum of elements in the array [1, 2, 3, 4, 5]
2. Multiply all elements of the same array by 2
3. Given a hashmap of countries to their populations, create a code block that will print "population of [country] is [population] million" for each element in the hashmap
4. Call a code block with yield (example below)
```rb
def count(x)
  return "No block" unless block_given?
  for i in (1..x)
    yield i
  end
end

count(5) { |x| puts x + 2 }
```
Write a function that takes in a comma-delimited string and uses `yield` to invoke a code block that outputs each word on a separate line.

## Procs

Think of these as making an object out of a code block. You can invoke Procs via `call`. Note that a code block is not an object.

The syntax is very similar to creating a code block: Consider a very simple code block that takes in a number `x` and returns the area of a square with side length `x`.

```rb
square = Proc.new{ |x| x**2}
puts square.call(2)
```

You can also pass in multiple parameters into a proc as follows:

```rb
list_two = Proc.new{|first, second| puts "#{first} and #{second} were passed in"}
```

Since procs are objects, it is possible to pass them as arguments into methods:

```rb
def do_something_on_variable(variable, something)
  something.call(variable)
end

puts do_something_on_variable(2, square) # outputs 4
```

You can also create nested Procs:

```rb
def say(y)
 t = Proc.new {|x| Proc.new {|z| z+x+y }}
return t
end
s = say(2).call(3)
puts s.call(4) # outputs 9
```

Keep this type of "function nesting" in the back of your head; we'll use it (a *lot*) when coding in OCaml!

## Proc Exercise

### `distance` 
Takes in coordinates `x_1`, `y_1`, `x_2`, `y_2` representing points $(x_1, y_1)$ and $(x_2, y_2)$ and outputs the Euclidean distance between them.
Remember that you can consult Ruby documentation for standard mathematical operations!

```rb
sample = distance.call(0, 0, 3, 4) # outputs 5.0
```

## Rectangle Class

We will now implement a simple class in Ruby in order to highlight fundamental OOP concepts. 

A `Rectangle` represents a rectangle shape.  The methods below will be implemented in the `Rectangle` class in [rectangle.rb](src/rectangle.rb).

#### `initialize(length, width)`

- **Type**: `(Integer, Integer) -> _`
- **Description**: Given a length and width for the rectangle, store them in the `Rectangle` object.  You should perform any initialization steps for the `Rectangle` instance here. The return value of this function does not matter. Note that we must keep track of the number of `Rectangle` objects that have been instantiated. 
- **Examples**:
  ```ruby
  square = Rectangle.new(5, 5)
  rectangle = Rectangle.new(2, 3)
  ```

Notice that we can also omit parentheses when inputting parameters. 

#### `getArea()`

- **Type**: `_ -> Integer`
- **Description**: Return the area of a `Rectangle`
- **Examples**:
  ```ruby
  square = Rectangle.new(5, 5)
  rectangle = Rectangle.new(2, 3)
  square.getArea()              # Returns 25
  rectangle.getArea()           # Returns 6
  ```

Notice that we can explicitly use the keyword `return` to return the area. If we choose to omit the `return` keyword, the method will return the last statement in the method. 

#### `self.getNumRectangles(n)`

- **Type**: `(Integer) -> Integer`
- **Description**: Return the number of `Rectangles`s whose area is less than n.  Hint: you should use a static data structure to keep track of this.
- **Examples**:
  ```ruby
  Rectangle.getNumRectangles(20)        # Returns 0
  square = Rectangle.new(5, 5)
  rectangle = Rectangle.new(2, 3)
  Rectangle.getNumRectangles(20)        # Returns 1
  Rectangle.getNumRectangles(30)        # Returns 2
  ```
