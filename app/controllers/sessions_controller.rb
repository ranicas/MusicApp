class SessionsController < ApplicationController
  
  def create
    @user = User.find_by_credentials(
      params[:user][:email], 
      params[:user][:password]
      )
    
    if @user
      log_in!(@user)
    else
      flash[:errors] = 
      render :new
    end
  end
  
  def destroy
    log_out!(current_user)
    redirect_to new_session_url
  end
  
  def new
    @user = User.new
    render :new
  end
  
end
