class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
  define_method :same_my_method do |my_arg|
    my_arg * 2
  end
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end
end

describe "class MyClass" do
  before(:each)  do
    @obj = MyClass.new
  end
  it "should call my_method using ." do
    @obj.my_method(3).should == 6
  end
  it "should also call my_method using send" do
    @obj.send(:my_method, 3).should == 6 #just use symbol :my_method,not just my_method
    (@obj.send(:my_method, 3) == @obj.my_method(3)).should == true
    #can't use string 'my_method' instead of :my_method
    #(@obj.send(:my_method, 3) == @obj.send("my_method", 3).should == true
  end
  it "should call an new method using another constructed" do
    @obj.same_my_method(3).should == 6
    #define_method is in Module
    #Module.should respond_to(:define_method)  ??
  end
  it "should call a missing method" do
    (@obj.talk_simple('a', 'b')).should == "You called: talk_simple(a,b)"
  end

  
end
