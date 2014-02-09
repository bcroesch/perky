class PermittedParams < Struct.new(:params, :user)

  %i[user account].each do |resource|
    class_eval <<-EOS
      def #{resource}
        params.require(:#{resource}).permit(*#{resource}_attributes)
      end
    EOS
  end

  def user_attributes
    [:email, :first_name, :last_name, :monthly_credits, :password, :password_confirmation, account_attributes: [:name, :stripe_card_token]]
  end

  def account_attributes
    [:name]
  end

end
