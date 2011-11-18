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
    end
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
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
end
