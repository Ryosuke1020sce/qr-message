class LinksController < ApplicationController
  before_action :set_message

  def new
    @link = @message.links.new
    @messages = Message.where.not(id: @message.id)
    @linked_ids = Link.where(message_id: @message.id).pluck(:linked_message_id)
  end

  def create
    @link = Link.new(
      message_id: @message.id,
      linked_message_id: params[:linked_message_id]
    )
    if @link.save
      redirect_to message_path(@message)
    else
      @messages = Message.where.not(id: @message.id)
      render new_message_link_path(@message), status: :unprocessable_entity
    end
  end

  def destroy
    @message = Message.find(params[:message_id])
    @link = Link.find(params[:id])
    @link.destroy  
    redirect_to message_path(@message) 
  end
  
  private

  def set_message
    @message = Message.find(params[:message_id])
  end
end
