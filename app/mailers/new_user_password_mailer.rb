class NewUserPasswordMailer < ActionMailer::Base
  default from: "from@example.com"
  layout '_mail_layout'

  def new_user(account_id, user_id)
    @account = Account.find(account_id)
    @user = @account.users.find(user_id)
    mail(to: @user.email, subject: "You've been added to a Perky Account!")
  end

end
