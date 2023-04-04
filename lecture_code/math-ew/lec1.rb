f = File.open("input.txt")
line = f.gets
line.chomp!

def lex(line)
  number = /^(-?\d+)/
  plus = /^\+/
  sub = /^-/
  mult = /^\*/
  div = /^\//
  exp = /^\^/
  sq = /^sq/
  wspace = /^ /

  tokens = []
  while line.length > 0
    if line =~ number
      tokens.push(["int",$1])
      line = line[$1.length..]
    elsif line =~ wspace
      line = line[1..]
    elsif line =~ plus
      tokens.push("plus")
      line = line[1..]
    elsif line =~ sub 
      tokens.push("sub")
      line = line[1..]
    elsif line =~ mult 
      tokens.push("mult")
      line = line[1..]
    elsif line =~ div
      tokens.push("div")
      line = line[1..]
    elsif line =~ exp
      tokens.push("exp")
      line = line[1..]
    elsif line =~ sq
      tokens.push("sq")
      line = line[2..]
    else
      raise IOError.new("unknown symbol")
    end
  end
  tokens
end

lexed = lex(line)
#puts lexed.to_s

def parser(tokens)
  parsed,leftover = parser2(tokens)
  if leftover == [] or leftover == nil
    return parsed
  else
    raise IOError.new("Gramatically incorrect")
  end
end

def parser2(tokens) #token -> tree,leftover
  tree = []
  if tokens == nil or tokens == []
    raise IOError.new("Gramatically incorrect")
  end
  curr = tokens[0] 
  if curr == "plus"
    op = "plus"  
    rest = tokens[1..]   
    e1,leftover = parser2(rest)
    e2,leftover = parser2(leftover)
    return [op,e1,e2],leftover
  elsif curr == "mult"
    op = "mult"  
    rest = tokens[1..]   
    e1,leftover = parser2(rest)
    e2,leftover = parser2(leftover)
    return [op,e1,e2],leftover
  elsif curr == "sub"
    op = "sub"  
    rest = tokens[1..]   
    e1,leftover = parser2(rest)
    e2,leftover = parser2(leftover)
    return [op,e1,e2],leftover
  elsif curr == "div"
    op = "div"  
    rest = tokens[1..]   
    e1,leftover = parser2(rest)
    e2,leftover = parser2(leftover)
    return [op,e1,e2],leftover
  elsif curr == "exp"
    op = "exp"  
    rest = tokens[1..]   
    e1,leftover = parser2(rest)
    e2,leftover = parser2(leftover)
    return [op,e1,e2],leftover
  elsif curr == "sq"
    op = "sq"  
    rest = tokens[1..]   
    e1,leftover = parser2(rest)
    return [op,e1],leftover
  elsif curr.class == Array
    int = curr[1]
    rest = tokens[1..]
    return [int],rest
  else
    raise IOError.new("Gramatically incorrect")
  end
end

parsed = parser(lexed)
puts parsed.to_s

def evaluate(tree)
  curr = tree 
  if curr.length == 1
    return curr[0].to_i
  elsif curr.length == 2
    op = curr[0]
    child = curr[1]
    e1 = evaluate(child) 
    if op == "sq"
      return e1 * e1 
    else
      raise IOError.new("Something wrong")
    end
  else
    op = curr[0]
    left = curr[1]
    right = curr[2]
    e1 = evaluate(left) 
    e2 = evaluate(right) 
    if op == "plus"
      return e1 + e2
    elsif op == "div"
      return e1 / e2
    elsif op == "mult"
      return e1 * e2
    elsif op == "sub"
      return e1 - e2
    elsif op == "exp"
      return e1 ** e2
    else
      raise IOError.new("does not make sense")
    end
  end
end
#puts parsed.to_s
value = evaluate(parsed)
puts value
