require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
      @mp1 = Factory(:micropost, :user => @user, :created_at => 1.day.ago)
      @mp2 = Factory(:micropost, :user => @user, :created_at => 1.hour.ago)
    end
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    it "should display the user's microposts" do 
      get :show, :id => @user
      response.should have_selector("span", :class => "content", 
                                            :content => @mp1.content)
      response.should have_selector("span", :class => "content", 
                                            :content => @mp2.content)
    end
  end
  
  
  describe "POST 'create'" do
    describe "failure" do
      
      before(:each) do
      @attr = { :name => "", 
                :email => "", 
                :password => "",
                :password_confirmation => "" }
      end
      
      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it "should have the right title" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Sign up")
      end
    
      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do 
      
      before(:each) do 
        @attr = { :name => "Ne User",
                  :email => "use@example.com",
                  :password => "foobar",
                  :password_confirmation => "foobar" 
                }
      end
     
      it "should create s user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
     
      it "should redirect to the user show page" do
        post :create , :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
      
      it "should have flash welcome" do
        post :create, :user => @attr
        flash[:success].should =~ /Welcome/i
      end
      it "should sign the user in" do
        post :create, :user => @attr
        controller.should be_signed_in
      end
    end
  end
  
  #test edit method in users_controller
  describe "GET 'edit'" do
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    it "should be success" do
      get :edit, :id => @user# use :id , not :user
      response.should be_success
    end
    it "should have the right title" do
      get :edit, :id => @user
      response.should have_selector("title", :content => "Edit user")
    end
    it "should have a link to change the Gravatar" do
      get :edit, :id => @user
      gavatar_url = "http://gavatar.com/emails"
      response.should have_selector("a", :href => gavatar_url, :content => "change")
    end
  end
  
  #test update method 
  describe "PUT 'update'" do
    before(:each)  do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    # test failure
    describe "fail" do
      before(:each) do
        @attr = { :name => '',
                  :email => '',
                  :password => '',
                  :password_confirmation => ''
                }
                 
      end
      it "should have the right title" do
        put :update, :id => @user, :user=> @attr
        response.should have_selector("title", :content => "Edit user")
      end
      it "should render the edit template" do
        put :update, :id => @user, :user=> @attr
        response.should render_template('edit')
      end
    end
    # test success
    before(:each) do
      @attr = { :name => 'neychang',
                :email => '123@qq.com',
                :password => 'asdfgh',
                :password_confirmation => 'asdfgh'
              }
    end
    it "should change the user's attributes" do
      put :update, :id => @user, :user=> @attr
      @user.reload#?
      @user.name.should == @attr[:name]
      @user.email.should == @attr[:email]
    end
    it "should redirect to the user show page" do
      put :update, :id => @user, :user => @attr
      response.should redirect_to(user_path(@user))
    end
    it "should have a flash message" do
      put :update, :id => @user, :user => @attr
      flash[:success].should =~ /updated/
    end
  end
  
  describe "authentication of edit/update pages" do
    before(:each) do
      @user = Factory(:user)
    end
    describe "for not sign in users" do
      it "should deny access to 'edit'" do
        get :edit, :id => @user
        response.should redirect_to(signin_path)  
      end
      it "should deny access to 'update'" do
        put :update, :id => @user, :user => {}
        response.should redirect_to(signin_path)
      end
    end
    describe "for sign in users" do
      before(:each) do
        @wrong_user = Factory(:user, :email => "users@example.net")#pay attention??????
        test_sign_in(@wrong_user)
      end
      it "should require matching users for 'edit'"do
        get :edit, :id => @user
        response.should redirect_to(root_path)
      end
      it "should require matching users for 'update'" do
        put :update, :id => @user, :user => {}
        response.should redirect_to(root_path)  
      end
    end
  end
  
  #test index
  describe "GET 'index'" do
    #
    describe "for non-signed-in users" do
      it "should deny access" do
        get :index
        response.should redirect_to(signin_path)
        flash[:notice].should =~  /sign in/i
      end
    end
    #??????
    describe "for signed-in users" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
        second = Factory(:user, :email => "another@example.com")
        third = Factory(:user, :email => "another@example.net")
        @users = [@user, second, third]
      end
      it "should be successful" do
        get :index
        response.should be_success
      end
      it "should have the right title" do
        get :index
        response.should have_selector("title", :content => "All users")
      end
      it "should have an element for each user" do
        get :index
        @users.each do |user|
          response.should have_selector("li", :content => user.name)
        end
      end
    end
  end
end


