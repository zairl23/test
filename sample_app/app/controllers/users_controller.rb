class UsersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :index]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :authenticate, :except => [:show, :new, :create]

  #get users
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end 
  
  def new
    @user = User.new
    @title = "Sign up"
  end
 
  def show
    @user = User.find(params[:id])
    @title = @user.name
    @microposts = @user.microposts.paginate(:page => params[:page])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user #session helper
      flash[:success] = "Welcome"

      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
    
  end
  
  def edit
    @user = User.find(params[:id])
    @title = 'Edit user'
  end
  #put update
 
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
     flash[:success] = "Profile updated."
     redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  
  def following
    @title = "Following"
    @user = User.find(params[:id])  
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end
 
  def followers
    @title = "Followers"
    @user = User.find(params[:id]) 
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  
  
  private
    
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

  
  
end
