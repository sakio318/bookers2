class ApplicationMailer < ActionMailer::Base
  default from: ENV['SECRET_USER_NAME']
  layout 'mailer'
end
