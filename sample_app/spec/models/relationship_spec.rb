require 'spec_helper'

describe Relationship do
  
  before(:each) do
    @follower = Factory(:user)
    @followed = Factory(:user, :email => Factory.next(:email))
    
    @relationship = @follower.relationships.build(:followed_id => @followed.id)
  end
  
  it "should create a new instance given valid attrbutes" do
    @relationship.save!
  end
  describe "follow methods" do
    before(:each) do
      @relationship.save
    end
    it "should have a follower attribute" do
      @relationship.should respond_to(:follower)
    it "should have the right follower" do
      @relationship.follower.should == @follower
    end
    
    
  end
  
end
