class Point
  def initialize(x, y)
    @x, @y = x, y
  end
  def to_s       #return a String that represents this poit
    "(#@x, #@y)" #display the instance variables into a string
  end
end

describe "Class Point" do
  before(:each) do
    @obj = Point.new(0,2)
  end
  it "should instantiating a Point" do
    @obj.class.should == Point
    @obj.is_a?(Point).should == true
  end
  it "should initializing a Poit" do
    @obj.instance_variables.should_not == [@x, @y]
    @obj.instance_variables.should == [:@x, :@y]
  end 
  it "should display the instance variables" do
    (@obj.to_s).should == "(0, 2)"
    (@obj.to_s).should_not == "(0,2)"    
  end 
end
