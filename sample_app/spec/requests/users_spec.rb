require 'spec_helper'

  describe "Users" do
    describe "signup" do
      describe "failure" do
        it "should not make a new user" do
          lambda do
            visit signup_path
            fill_in "Name", :with => ""
            fill_in "Email",:with => ""
            fill_in "Password",:with => ""
            fill_in "Password confirmation", :with => ""
            click_button
            response.should render_template('users/new')
            response.should have_selector("div#error_explanation")
          end.should_not change(User, :count)
        end
      end
       
      describe "success" do 
        it "should make a new user" do 
          lambda do
            visit signup_path
            fill_in "Name", :with => "zairl6"
            fill_in "Email",:with => "zairl9@qq.com"
            fill_in "Password",:with => "asdfgh"
            fill_in "Password confirmation", :with => "asdfgh"
            click_button
            response.should render_template('users/show')
            response.should have_selector("div.flash",
              :content => "Welcome")

          end.should change(User, :count).by(1) 
          
        end
      end 
      
      describe "when signed in" do
        before(:each) do
          @user = Factory(:user)
          visit signin_path
          fill_in :email, :with => @user.email
          fill_in :password, :with => @user.password
          click_button
        end

        it "should have a signout link" do
          visit root_path
          response.should have_selector("a", :href => signout_path,
                                          :content => "Sign out")
        end
      end
    end
  end


