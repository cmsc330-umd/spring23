def mycb(x)
  puts "in mycb"
  if block_given?
    yield
  else
    puts "no block"
  end
  puts x
  puts "back in mycb"
end


def puts_hello
  puts "hello"
end

def add
  yield 4
end

def mycb
  a = yield 
  puts a 
end

mycb


