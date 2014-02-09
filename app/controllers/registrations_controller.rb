class RegistrationsController < Devise::RegistrationsController
  # before_filter :update_sanitized_params, if: :devise_controller?

  # def update_sanitized_params
  #   devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation)}
  #   devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
  # end

  def build_resource(params)
    super
    self.resource.account = Account.new if self.resource.account.nil?
    self.resource.admin = true
    self.resource
  end

  def sign_up_params
    permitted_params.user
  end

end
