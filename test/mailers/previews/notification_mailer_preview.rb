# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def notification_email
    NotificationMailer.notification_email(Comment.first)
  end
end
