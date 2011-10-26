class RSpecGreeter < RSpec::Core::ExampleGroup
  def greet
    "Hello Rspec!"
  end
end


describe "RSpec Greeter" do 
  it "should say 'Hello RSpec!' when it receives the greet() message" do 
    greeter = RSpecGreeter.new
    greeting = greeter.greet
    greeting.should == "Hello Rspec!"
  end
end
