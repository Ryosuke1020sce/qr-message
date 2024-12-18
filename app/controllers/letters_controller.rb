class LettersController < ApplicationController

  def create
    @message = Message.find(params[:message_id])
    @letter = Letter.new(letter_params)
    if @letter.save
      redirect_to message_path(@message.id)
    end
  end

  private

  def letter_params
    params.require(:letter).permit(:text).merge(message_id: @message.id)
  end

end
