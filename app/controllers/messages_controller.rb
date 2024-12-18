class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.where(user_id: current_user.id)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @message = Message.find(params[:id])
    @letters = Letter.where(message_id: @message.id)
    @letter = Letter.new
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :date, :permit_comment).merge(user_id: current_user.id)
  end
end
