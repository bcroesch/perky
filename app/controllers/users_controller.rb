class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_account

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
    @user = @account.users.new
  end

  def create
    debugger
    @user = @account.users.new(permitted_params.user)
    if @user.save
      redirect_to @user
    else
      debugger
      flash[:alert] = 'Error with creation'
      render action: 'new'
    end
  end

  protected

  def set_account
    @account = Account.find(params[:account_id])
  end

end
