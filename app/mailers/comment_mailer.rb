class CommentMailer < ApplicationMailer

  def detect_comment_email(user, message, comment)
    @user = user
    @message = message
    @comment = comment
    mail(to: @user.email, subject: "#{@message.to}のメッセージから返信がありました！")
  end

end
