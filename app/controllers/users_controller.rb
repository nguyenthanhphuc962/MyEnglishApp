class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user, only: [:edit, :update]
  def new
  	@user = User.new
  end
  def show
  	@user = User.find(params[:id])
  end
  def create 
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
    	flash[:success] = "Sign up successful"
    	redirect_to user_path(@user)
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash.now[:success] = "Your Profile is updated."
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end


  private
  	def user_params 
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  	end

    

    # Checking user logged in or not
    def logged_in_user 
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end
end
