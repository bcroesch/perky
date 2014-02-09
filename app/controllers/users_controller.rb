class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:welcome, :set_initial_password]
  before_action :set_account, except: [:update]
  before_action :set_user, only: [:update]

  respond_to :json, only: [:update, :destroy]

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
    @user.monthly_credits = @account.default_monthly_credits
  end

  def update
    logger.info params
    if @user.update(permitted_params.user)
      render json: {request: 'success'}
    else
      render json: {request: 'failed'}
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
      redirect_to account_users_url(@account)
    else
      flash[:alert] = 'Error with creation'
      render action: 'new'
    end
  end

  def destroy
    @user.destroy

    render json: {request: 'success'}
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

  def set_user
    @user = User.find(params[:id])
  end

end
