class Square
  @@pop = 0

  def initialize(size)
    @size = size
    @@pop +=1
  end

  def area
    @size*@size
  end

  def pop
    @@pop
  end
end

a = Square.new(5)
b = Square.new(6)

puts a.area
puts b.area

puts a.pop
