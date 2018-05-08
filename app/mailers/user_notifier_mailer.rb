class UserNotifierMailer < ApplicationMailer
  def send_notification(user)
  @user = user

  mail to: @user.email, subject: "Thanks for signing up"
  end
end
