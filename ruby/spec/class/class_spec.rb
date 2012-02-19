class China
  attr_accessor :province
  def self.hubei
    China.new(:province => "hubei")
  end
end
describe "China" do
  before(:each) do
    @a = China.hubei
  end
  it "should have attribute province = 'hubei'" do
    @a.province.should == "hubei"
  end
end
# what's wrong with watchr?

