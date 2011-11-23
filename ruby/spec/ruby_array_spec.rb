describe "Base" do

  before(:each) do
    @a = ['Hello','Ruby!',1]
    @b = ['Hello',3,1]
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
  
  describe "Math methods" do
    it "using +" do
      (@a + @b).should_not == ['Hello','Ruby!',1,3] 
      (@a + @b).should == ['Hello','Ruby!',1,'Hello',3,1]
      (@b + @a).should_not == ['Hello','Ruby!',1,'Hello',3,1]
      (@b + @a).should == ['Hello',3,1,'Hello','Ruby!',1]
      ( (@a + @b) == (@b +@a) ).should be_false
    end
    it "using -" do
      (@a - @b).should == ['Ruby!']
      (@b - @a).should == [3]
    end
    it "using | " do 
      (@a | @b).should == ['Hello','Ruby!',1,3]
      (@b | @a).should == ['Hello',3,1,'Ruby!']
      ( (@a | @b) == (@b | @a) ).should be_false
    end
    it "using &" do 
      (@a & @b).should == ["Hello",1]
      (@b & @a).should == ["Hello",1]
      @b.reverse!
      (@a & @b).should == ["Hello",1] 
      (@b & @a).should == [1,"Hello"]
    end
  end

  describe "Select methods" do
    it "first" do
      @a.should == ['Hello','Ruby!',1]
    end  
    it "select the element(s)'s index(s) in a array" do
      @a << 1
      @a.index(1).should == 2#first found
      @a.index('Hello').should == 0
      @a.rindex(1).should == 3#last found
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

  describe "Add methods that" do
    it "add one element to an array's tail" do
      ((@a << 1) == (@a.push(1))).should == true
    end
    it "add one element to an array's head" do
      @a.unshift(1).should == [1,'Hello','Ruby!',1]
    end
    it "add elements to an array" do 
      (@a.insert(0,1) == @a.unshift(1)).should == true#
      
    end
  end

  describe "Deltete methods" do
    it "delete an array's tail" do
      #@a.pop.should_not == ["Hello","Ruby!"]
      #@a.pop.should_not == @a.last
      #(@a.pop == @a.last).should == true
      @a.pop.should == 1
      @a.last.should == 'Ruby!'
    end 
    it "delete an array's head" do 
      @a.shift.should == "Hello"
    end
    it "delete an array's any element using item" do
      @a.delete_at(0).should == "Hello"
    end
    it "delete an array's ant element using elememt" do
      @a.delete(1).should == 1
    end
  end

  describe "Convert methods that" do
    it "converts a array to the array with reverse order" do
      @a.reverse.should == [1,'Ruby!', 'Hello']
    end
    it "convert a array in the sortable order" do
      #@a.sort.should == [1,'Ruby!','Hello'] error:comparison of String with 1 failed
      @a = [1,3,2]
      @a.sort.should == [1,2,3]
    end
    it "convert a array to the array with uniq elements" do
      @a << 1
      @a.uniq.should == ['Hello','Ruby!', 1]
    end
    it "convert a array to the string in the printable format" do
      @a.inspect.class.should == String
      @a.inspect.should_not == "@a"
      @a.inspect.should_not == "[\'Hello\', \'Ruby\', 1]"
      @a.inspect.should_not == "[\"Hello\",\"Ruby!\", 1]"
      @a.inspect.should == "[\"Hello\", \"Ruby!\", 1]"
      ([1,2,3].inspect == [1, 2, 3].inspect).should == true
      (['a','b'].inspect == ['a', 'b'].inspect).should == true
    end
    it "convert a array to string" do
      @a.to_s.should_not == "\'Hello\',\'Ruby!\',1"
      @a.to_s.should_not == "[\"Hello\",\"Ruby!\",1]"
      @a.to_s.should == "[\"Hello\", \"Ruby!\", 1]"
      b = [1,2,3]
      b.to_s.should_not == "123"
      b.to_s.should == "[1, 2, 3]"
      b.join.should_not == "1, 2, 3"
      b.join.should == "123"
      b.join(', ').should == "1, 2, 3"
    end
  end

  describe "Destroy methods" do

  end

  describe "Iterator methods" do

  end
 
end
