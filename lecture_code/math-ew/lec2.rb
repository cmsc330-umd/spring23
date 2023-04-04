f = File.open("input.txt")
line = f.gets
line = line.chomp

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
    elsif line =~ div 
      tokens.push("div") 
      line = line[1..]
    elsif line =~sub 
      tokens.push("sub") 
      line = line[1..]
    elsif line =~ mult 
      tokens.push("mult") 
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


def parser(tokens)
  tree,leftover = parser2(tokens)
  if leftover == nil or leftover == []
    return tree 
  else
    raise IOError.new("Grammatically invalid") 
  end
end

def parser2(tokens)
  if tokens == [] or tokens == nil
    raise IOError.new("grammatically invalid")
  end
  curr = tokens[0]
  if curr == "plus"
    op = "plus"
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
  elsif curr == "mult"
    op = "mult"
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
    raise IOError.new("grammatically incorrect")
  end
end

def interp(tree)
  curr = tree
  if curr.length == 3
    op = curr[0]
    v1 = interp curr[1]
    v2 = interp curr[2]
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
      raise IOError.new("does not make sense")
    end
  elsif curr.length == 1
    return curr[0].to_i 
  elsif curr.length == 2
    op = curr[0]
    if op == "sq"
      v1 = interp curr[1]
      return v1 * v1
    else
    raise IOError.new("does not make sense")
    end
  else
    raise IOError.new("does not make sense")
  end
end


lexed = lex(line)
puts lexed.to_s
parsed = parser(lexed)
puts parsed.to_s
value = interp(parsed)
puts value
