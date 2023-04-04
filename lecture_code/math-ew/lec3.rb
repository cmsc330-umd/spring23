f = File.open("input.txt")
line = f.gets
line = line.chomp

def lex(line)
  number = /^(-?\d+)/
  plus = /^\+/
  mult = /^\*/
  sub = /^-/
  div = /^\//
  exp = /^\^/
  sq = /^sq/
  wspace = /^ /

  token = []

  while line.length > 0 
    if line =~ number
      token.push(["int",$1]) 
      line = line[$1.length..]
    elsif line =~ wspace
      line = line[1..]
    elsif line =~ plus
      token.push("plus")
      line = line[1..]
    elsif line =~ sub 
      token.push("sub")
      line = line[1..]
    elsif line =~ mult 
      token.push("mult")
      line = line[1..]
    elsif line =~ div 
      token.push("div")
      line = line[1..]
    elsif line =~ exp 
      token.push("exp")
      line = line[1..]
    elsif line =~ sq
      token.push("sq")
      line = line[2..]
    else 
      raise IOError.new("Character not allowed")
    end
  end
  token
end

def parser(tokens)
  tree,leftover = parser2(tokens)
  if leftover.length > 0 then
    raise IOError.new("grammatically incorrect")
  end
  return tree
end

def parser2(tokens)
  #[op,e1,e2]
  #[op,e1]
  #[n]
  if tokens == nil or tokens == []
    raise IOError.new("Grammatically invliad")
  end
  curr = tokens[0]
  rest = tokens[1..]
  if curr == "plus" or curr == "sub" or curr == "mult" or curr == "div" or curr == "exp"
    node = [curr] 
    e1,leftover = parser2(rest)
    e2,leftover = parser2(leftover) 
    node.push(e1)
    node.push(e2)
    return node,leftover
  elsif curr == "sq"
    node = [curr]   
    e1,leftover = parser2(rest)
    node.push(e1)
    return node,leftover
  elsif curr.class == Array
    if curr[0] == "int" 
      int = curr[1].to_i
      return [int],rest
    else
      raise IOError.new("grammatically wrong") 
    end
  else
    raise IOError.new("grammatically wrong") 
  end
end

def evaluator(tree)
  if tree.length == 3
    op = tree[0]
    v1 = evaluator(tree[1])  
    v2 = evaluator(tree[2])  
    if op == "plus" 
      return v1 + v2
    elsif op == "sub"
      return v1 - v2
    elsif op == "mult"
      return v1 * v2
    elsif op == "div"
      return v1 / v2
    elsif op == "exp"
      return v1 ** v2
    else
      raise IOError.new("Makes no sense")
    end
  elsif tree.length == 2
    op = tree[0]
    v1 = evaluator(tree[1])
    if op == "sq"
      return v1 * v1
    else
      raise IOError.new("makes no sense")
    end
  elsif tree.length == 1
    return tree[0]
  else
    raise IOError.new("Makes no sense")
  end
end

lexed = lex(line)
puts lexed.to_s
parsed = parser(lexed)
puts parsed.to_s
value = evaluator(parsed)
puts value
