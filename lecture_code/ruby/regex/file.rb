f = File.open("file2.txt")
regex = /^([A-Z][a-z0-9]+): ([0-9]{3})-([0-9]{3})-([0-9]{4})$/
phonebook = {}
line = f.gets
while line
  if line =~ regex
    phonebook[$1] = $2+$3+$4 
  end
  line = f.gets
end
f.close
puts phonebook
puts phonebook.values
puts phonebook.keys
puts phonebook["Name2"]
