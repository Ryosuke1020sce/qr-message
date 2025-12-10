class CommentsController < ApplicationController

  def create
    @message = Message.find(params[:message_id])
    @comment = Comment.new(comment_params)
    @user = User.find(@message.user_id)

    if @comment.save
      flash[:notice] = "返信ありがとうございます！"
      CommentMailer.detect_comment_email(@user, @message, @comment).deliver_now
      redirect_to "/messages/#{@message.id}/uuid_disp/#{@message.uuid}"
    else
      flash[:notice] = "申し訳ございません。返信できませんでした…。"
      redirect_to "/messages/#{@message.id}/uuid_disp/#{@message.uuid}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :from).merge(message_id: @message.id)
  end
end
