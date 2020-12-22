class NotificationMailer < ApplicationMailer
   default from: ENV['SECRET_USER_NAME']
  def complete_mail(user)
    @user = user
    mail(:subject => "ようこそBookers2へ", to: user.email)
  end
end
