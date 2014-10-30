class UsersController < ApplicationController
   before_action :logged_in, only: [:show]
  
  def new 
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      log_in!(@user)
      redirect_to user_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    @user = current_user
    render :show
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
