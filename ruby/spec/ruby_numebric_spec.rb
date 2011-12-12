describe "test numberic" do
  it "test % " do
    ((-4 % 3) == (4 % (-3) )).should == false
    (-4 % 3).should == 2 
    (-4 / 3).should == -2 #必须保证余数和除数的符号一致
    (4 % -3).should == -2
    (4 / -3).should == -2 
    
  end
  it "test float" do
    ((0.4 - 0.3) == 0.1).should_not == true
    (0.4 - 0.3).should_not == 0.1#float在计算机上是如何表示?
    (0.4 - 0.3).should ==  0.10000000000000003
  end
  
end
