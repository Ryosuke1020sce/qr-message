class LettersController < ApplicationController
  before_action :set_message_nest, only: [:create, :edit, :update, :destroy]
  before_action :set_letter, only: [:edit, :update, :destroy]

  def create
    @letter = Letter.new(letter_params)
    if @letter.save
      redirect_to message_path(@message.id)
    end
  end

  def edit
  end

  def update
    if @letter.update(letter_params)
      redirect_to message_path(@message.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @letter.destroy
    redirect_to message_path(@message.id)
  end

  private

  def letter_params
    params.require(:letter).permit(:text).merge(message_id: @message.id)
  end

  def set_message_nest
    @message = Message.find(params[:message_id])
  end

  def set_letter
    @letter = Letter.find(params[:id])
  end

end
