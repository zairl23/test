describe "Hash methods" do
  before(:each) do
    @a = { :first => 'ney',
           :last  => 'chang',
           :year  => 25 
         }
  end
  
  describe "Select methods" do
    it "return value using  given key" do
      @a[:year].should == 25
    end
    it "return key using given value" do
      @a.index(:year).should == nil
      @a.index(25).should == :year
    end
  end

  describe "Add methods" do

  end

  describe "Deltete methods" do
    it "delete an element using key" do
      @a.delete(:year).should == 25
      @a.should == {:first => 'ney', :last => 'chang'}
    end
    it "delete the last element" do
      #@a.shift.class.should == Array
      @a.shift.should_not == [[:last, 'chang'],[:year, 25]] 
      @a.shift.should == [:first, 'ney']
    end
  end

  describe "Convert methods" do
    it "converts a hash in an order" do
      @a.sort.should_not == @a
      @a.sort.class.should_not == Hash
      @a.sort.class.should == Array
      @a.sort.should == [ [:first, 'ney'],[:last, 'chang'], [:year, 25]]
    end
    it "converts a hash in a print format" do
      @a.inspect.should_not == "{:first => \"ney\", :last => \"chang\", :year => 25}"
      @a.inspect.should == "{:first=>\"ney\", :last=>\"chang\", :year=>25}"
    end
  end

  describe "Destroy methods" do

  end

  describe "Iterator methods" do

  end

  describe "Question methods that" do
    it "question where key or value" do
      @a.has_key?(:year).should == true
      @a.has_value?(25).should == true
      @a.has_key?('jk').should == false
    end
  end
  
end
