class UsersController < ApplicationController
  def new
  end
 
  def show
    @user = User.find(params[:id])
    @title = 'Sign up'
  end
  
end
