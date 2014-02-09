class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:welcome, :set_initial_password]
  before_action :set_account, except: [:update, :destroy]
  before_action :set_user, only: [:update, :destroy]

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
    if @user.update(permitted_params.user)
      account_total = @user.account.total_monthly_allocation
      render json: {request: 'success', account_total: account_total}
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
      
      respond_to do |format|

        format.html { redirect_to account_users_url(@account) }
        format.json { 
          account_total = @user.account.total_monthly_allocation
          render :json => {request: 'success', account_total: account_total} 
        }
      end
      
    else
      flash[:alert] = 'Error with creation'
      render action: 'new'
    end
  end

  def destroy
    account = @user.account
    @user.destroy
    
    render json: {request: 'success', account_total: account.total_monthly_allocation}
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
    @account = Account.find(params[:account_id]) unless params[:account_id].blank?
  end

  def set_user
    @user = User.find(params[:id])
  end

end
