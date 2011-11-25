class String
  def to_alphanumeric
    gsub /[^\w\s]/, ''
  end
end

#Example Class
module M
end

  class MyClass
    include M
    @a = 2
    def my_method
      @v = 1
    end
  end
#end


describe "object model that" do
  it "test to_alphanumeric " do
    '#3, the *Magic, Number*?'.to_alphanumeric.should == '3 the Magic Number'
  end
  
  describe "test MyClass" do
    before(:each) do
      @obj = MyClass.new 
    end
    it "should not have any instance valiable without calling my_method" do 
      @obj.class.should == MyClass
      @obj.instance_variables.should == []
    end
    it "should have @v with calling my_method" do
      @obj.my_method
      @obj.instance_variables.should == [:@v]
    end
    it "should have many methods contain my_method" do
      @obj.methods.class.should == Array
      @obj.methods.should_not == []
      @obj.methods.first.should == :my_method
      @obj.methods.grep(/my/).should_not == :my_method
      @obj.methods.grep(/my/).should == [:my_method]
    end 
    it "should have diff methods btween obj and class" do
      (@obj.methods == MyClass.methods).should == false
      (@obj.methods == MyClass.instance_methods).should == true
    end
    it "should know ancestors" do
      @obj.class.ancestors.should == [MyClass, M, Object,
       RSpec::Mocks::Methods,
       PP::ObjectMixin,
       RSpec::Core::SharedExampleGroup,
       RSpec::Core::DSL,
       Kernel,
       BasicObject]

    end
  end
end
