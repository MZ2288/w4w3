class SessionsController < ApplicationController

  before_action :already_loggedin, only: :new


  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
    params[:user][:user_name],
    params[:user][:password]
    )

    if @user.nil?
      render :new
    else
      login_user!(@user)
      redirect_to root_path
    end
  end

  def destroy
    logout_user!
    redirect_to '/session/new'
  end

end
