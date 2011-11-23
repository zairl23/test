describe "Rang" do
  before(:each) do
     @a = 1..9
  end
  
  describe "like question methods that" do
    it "Questiona range where has giving arg" do
      @a.cover?(0).should == false
      @a.include?(0).should == false
    end
  end
  
  describe "like convert methods that" do
    it "Converts an range to array" do
      @a.to_a.should == [1,2,3,4,5,6,7,8,9]
      
    end
  end
end
