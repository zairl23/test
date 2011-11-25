describe "test Ruby's operators" do
  before(:each) do 
    
  end
  
  it "test > < " do 
    (2 > 3).should == false
    ('a' > 'A').should == true
    #can't exe (2 > 'a').should == true
  end
  it "test ==, !=" do
    (2 == 3).should_not == true
    (2 == '2'.to_i).should == true
    ('' == nil).should_not == true
    (false == nil).should == false
    (false != nil).should == true
    ('' == ' ').should == false
    (2 == 2.0).should == true
    (2 === 2.0).should == true
  end 
end
