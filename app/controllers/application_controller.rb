class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  def after_sign_in_path_for(user)
    if user.admin
      account_users_url(user.account)
    else
      root_url
    end
  end

  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end

  debugger = binding.pry

end
