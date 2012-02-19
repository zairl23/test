class Person
  attr_accessor :name
end
p = Person.new
p.name = "neychang"
puts p.name

class People
  def name()
    @name
  end
  def name=(name)
    @name = name
  end
end
p1 = People.new
p1.name = "neychang"
puts p1.name  # return neychang

class Human
  attr_accessor :name
  def initialize(name) 
    @name = name
  end
end
h = Human.new("neychang")
puts h  # <Human:0x8902b3c>
puts h.name # neychang
