class GuestsController < ApplicationController

  def show
    @message = Message.find(params[:id])
    @letters = Letter.where(message_id: @message.id)
  end

end
