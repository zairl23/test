class RubyString < RSpec::Core::ExampleGroup
  def hello_ruby_string
    "Hello RubyString"
  end
end

describe "just hello!" do
    it "first test" do
      a = RubyString.new
      b = a.hello_ruby_string
      b.should == "Hello RubyString"
    end
end

describe "string methods test" do 
  before(:each) do
    @a = String.new("hello ruby!")
  end
  
  it "test include?" do
    @a.include?("ll").should == true
  end
  
  it "test index" do
    arr = @a.split(%r{\s*})
    arr.each do |a|
      @a.index(a).should == arr.index(a) 
    #@a.index('h').should == 0
    #@a.index('e').should == 1
    #@a.index('l').should == 2 
   # @a.index('l').should == 3 
    #@a.index('o').should == 4 
    #@a.index(' ').should == 5 
    #@a.index('r').should == 6
    #@a.index('u').should == 7 
    #@a.index('b').should == 8
    #@a.index('y').should == 9 
    #@a.index('!').should == 10
    end   
  end
end

