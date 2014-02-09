class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:welcome, :set_initial_password]
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

  def edit
    @user = @account.users.find(params[:id])
  end

  def new
    @user = @account.users.new
  end

  def update
    @user = @account.users.find(params[:id])
    if @user.update(permitted_params.user)
      flash[:notice] = 'User updated successfully'
      redirect_to [@account, @user]
    else
      flash[:alert] = 'Error with user creation'
      render action: 'edit'
    end
  end

  def create
    @user = @account.users.new(permitted_params.user)
    @user.password = SecureRandom.hex(10)
    if @user.save
      #send the email
      @user.reset_password_token = SecureRandom.hex(15)
      @user.save
      NewUserPasswordMailer.new_user(@account.id,@user.id).deliver
      redirect_to [@account, @user]
    else
      flash[:alert] = 'Error with creation'
      render action: 'new'
    end
  end

  def set_initial_password
    @user = @account.users.find_by_reset_password_token(params[:token])
    if @user.update(permitted_params.user.merge(reset_password_token: nil))
      sign_in @user
      redirect_to root_url, flash: {notice: 'User updated successfully'}
    else
      render action: 'edit', flash: {alert: 'Error with user creation'}
    end
  end

  def welcome
    @user = @account.users.find_by_reset_password_token(params[:token])
  end

  protected

  def set_account
    @account = Account.find(params[:account_id])
  end

end
