describe "Hash methods" do
  before(:each) do
    @a = { :first => 'ney',
           :last  => 'chang',
           :year  => 25 
         }
  end
  
  describe "Select methods" do
    it "return value of the giving key" do
      @a[:year].should == 25
    end
  end

  describe "Add methods" do

  end

  describe "Deltete methods" do

  end

  describe "Convert methods" do

  end

  describe "Destroy methods" do

  end

  describe "Iterator methods" do

  end

  describe "Question methods" do

  end
  
end
