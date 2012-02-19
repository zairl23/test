class Route
  def initialize(items)
    @items = items 
  
  end
  def items 
    @items
  end
end
route = Route.new("abc")
puts route.items
