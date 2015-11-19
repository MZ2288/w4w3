class UsersController < ApplicationController

  before_action :already_loggedin, only: :new

  def new
    @user = User.new
    render :new
  end

  def create
    @user = user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render :new
    end
  end

  protected
  def user_params
    self.params.require(:user).permit(:user_name, :password)
  end
end
