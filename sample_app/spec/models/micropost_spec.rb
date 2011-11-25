require 'spec_helper'

describe Micropost do
  before(:each) do
    @user = Factory(:user)#another model use
    @attr = { :content => "value for content" }
  end

  describe "validations" do
    it "should require a user id" do
      Micropost.new(@attr).should_not be_valid
    end
    it "should require nonblank content" do
      @user.microposts.build(:content => " ").should_not be_valid
    end
    it "should reject long content" do
      @user.microposts.build(:content => "a" * 141).should_not be_valid
    end
  end

   
end
