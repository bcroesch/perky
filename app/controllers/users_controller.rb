class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.admin
      @users = current_user.account.users
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
