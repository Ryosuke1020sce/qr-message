class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:display, :uuid_disp]
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_message_nest, only: [:display, :destroy_confirm]

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
    @letters = Letter.where(message_id: @message.id)
    @letter = Letter.new
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to message_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path
  end

  def destroy_confirm
  end

  def display
    @letters = Letter.where(message_id: @message.id)
  end

  def uuid_disp
    @message = Message.find_by(uuid: params[:uuid])
    @letters = Letter.where(message_id: @message.id)
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :date, :permit_comment).merge(user_id: current_user.id)
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def set_message_nest
    @message = Message.find(params[:message_id])
  end

end
