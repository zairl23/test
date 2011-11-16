class UsersController < ApplicationController
  def new
    @user = User.new
  end
 
  def show
    @user = User.find(params[:id])
    @title = 'Sign up'
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome"

      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  
  
end
