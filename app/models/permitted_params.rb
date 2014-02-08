class PermittedParams < Struct.new(:params, :user)

  %i[user account credit_card].each do |resource|
    class_eval <<-EOS
      def #{resource}
        params.require(:#{resource}).permit(*#{resource}_attributes)
      end
    EOS
  end

  def credit_card
    params.permit(:stripe_card_token)
  end
  
  def user_attributes
    [:email, :first_name, :last_name, :password, :password_confirmation, account_attributes: [:name]]    
  end

  def account_attributes
    [:name]
  end

end