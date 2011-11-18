describe "Base" do

  before(:each) do
    @a = ['Hello','Ruby!',1]
  end

  describe "Question methods" do
    it "questions a array if empty?" do
      @a.empty?.should == false
    end
    it "questions a array if include the string" do
      @a.include?('z').should == false
      @a.include?(1).should == true
      @a.include?('12').should == false
      @a.include?('llo').should == false
      @a.include?('Hello').should == true 
    end
  end

  describe "Select methods" do
    it "first" do
      @a.should == ['Hello','Ruby!',1]
    end  
    it "select the element(s)'s index(s) in a array" do
      @a << 1
      @a.index(1).should == 2
      @a.index('Hello').should == 0
      @a.rindex(1).should == 3
    end
    it "select the element(s) in a array" do
      @a[0].should == "Hello" 
      @a[-1].should == 1 
      @a.first.should == "Hello"
      @a.last.should == 1 
      @a.first(2).should == ['Hello','Ruby!']
      @a.first(4).should == ['Hello', 'Ruby!',1]
      #@a.all.should == @a error:undefined method `all' for
      @a.last(1).should == [1] #is not 1 ,[-1]
      @a.last(2).should == ['Ruby!', 1]
    end
    it "select the number of items of a array" do
      @a.length.should == 3
    end
    it "seclects the item of a array with index " do
      @a.slice(0).should == 'Hello'
      @a.slice(0,2).should == ['Hello','Ruby!']
    end
  end

  describe "Add methods" do
 
  end

  describe "Deltete methods" do

  end

  describe "Convert methods" do
    it "converts a array to the reverse order" do
      @a.reverse.should == [1,'Ruby!', 'Hello']
    end
    it "convert a array in the sortable order" do
      #@a.sort.should == [1,'Ruby!','Hello'] error:comparison of String with 1 failed
      @a = [1,3,2]
      @a.sort.should == [1,2,3]
    end
  end

  describe "Destroy methods" do

  end

  describe "Iterator methods" do

  end

end
