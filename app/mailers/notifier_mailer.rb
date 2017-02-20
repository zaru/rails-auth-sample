class NotifierMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def password_reset_instructions(user)
    @user = user
    mail(to: user.email, subject: "Password Reset Instructions")
  end
end
