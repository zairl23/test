require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @attr = { :name                  => "neychang", 
              :email                 => "zairl23@126.com", 
              :password              => "neychang", 
              :password_confirmation => "neychang"
             } 
  end
 

  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ''))
    no_email_user.should_not be_valid
  end
  
  it "should reject names that are too long" do 
    long_name = 'a' * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should reject invalid email address" do
    addresses = %w[user@foo,com,ueser_at_foo.org,example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should have virlua attribute password" do
    user = User.new(@attr)
    user.should respond_to(:password)
  end
  
  it "should require a password" do
    no_password_user = User.new(@attr.merge(:password => '', 
                              :password_confirmation => ''
                              ))
    no_password_user.should_not be_valid
  end
  
  it "should reject user about password's length" do
    invalid_password = 'a' * 51
    invalid_password_confirmation = 'a' * 51
    user = User.new(@attr.merge(:password => invalid_password,
                                :password_confirmation => invalid_password_confirmation
                               ))
    user.should_not be_valid
  end
  
  it "should have an encrypted password attribute" do
    user = User.new(@attr)
    user.should respond_to(:encrypted_password)
  end

  describe "encrypted password" do
    before(:each) do 
      @user = User.create!(@attr)
    end
  
    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
    
    describe "has_password? method" do
      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end

      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end
    end
    
    describe "authenticate method" do
      it "should return nil on email/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_password_user.should be_nil
      end
    
      it "should return nil for an email address with no user" do
        nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
        nonexistent_user.should be_nil
      end
    
      it "should return the user on email/password match" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end
    end


  end
  
  describe "micropost associations" do
    before(:each) do
      @user = User.create(@attr)
      @mp1 = Factory(:micropost, :user => @user, :created_at => 1.day.ago)
      @mp2 = Factory(:micropost, :user => @user, :created_at => 1.hour.ago)
    end
    it "should have a microposts attribute" do
      @user.should respond_to(:microposts)
    end
    it "should have the right microposts in the right order" do
      @user.microposts.should == [@mp2, @mp1]
    end
    it "should destroy associated microposts" do
      @user.destroy
      [@mp1, @mp2].each do |micropost|
         Micropost.find_by_id(micropost.id).should be_nil
      end
      #Another test to it
      #lambda do
       # Micropost.find(micropost.id)
        #end.should raise_error(ActiveRecord::RecordNotFound)
      #end
    end
    it "should have a feed" do
      @user.should respond_to(:feed)
    end
    it "should feed the microposts" do
      @user.feed.should == [@mp2, @mp1]
      @user.feed.include?(@mp2).should be_true
    end
    it "should show feed in correct user" do
      @other_user = User.create(@attr, :email => '12@qq.com')
      @other_user.feed.include?(@mp2).should == false
    end
    
  end
  
  
end


