class DailyMailer < ApplicationMailer
  def daily_mail
    mail(subject: "本の投稿をしませんか？", bcc: Admin.pluck(:email))
  end
end
