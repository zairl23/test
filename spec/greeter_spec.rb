#follow the book, just type 'class RspecGreeter ...'
# but rasie errors below:
#Failure/Error: greeter = RSpecGreeter.new
#  uninitialized constant RSpec::Core::ExampleGroup::Nested_1::RSpecGreeter
# ./greeter_spec.rb:3:in `block (2 levels) in <top (required)>'
#so i add this below '< RSpec::Core::ExampleGroup', and it works.why?

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
