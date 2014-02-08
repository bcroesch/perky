class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.admin
      @users = current_user.account.users
    end
  end

  def show
    if current_user.admin
      @user = current_user.account.users.find(params[:id])
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:alert] = 'Error with creation'
      render action: 'new'
    end
  end

  protected

  def user_params
    params.require(:user).permit(:first_name ,:last_name, :email)
  end

end
