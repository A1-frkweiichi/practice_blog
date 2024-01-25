class NotificationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notification_email(comment)
    @comment = comment
    @entry = @comment.entry
    @blog = @entry.blog

    @url  = blog_entry_url(@blog, @entry)
    mail(to: Rails.application.credentials.notification_mailer[:to_email], subject: 'コメント通知')
  end
end
