class LinksController < ApplicationController
  before_action :set_message

  def new
    @link = @message.links.new
    @messages = Message.where.not(id: @message.id)
  end

  def create
    @link = Link.new(message_id: params[:parent_message_id])
    if @link.save
      redirect_to message_path(@message), notice: "リンクを追加しました"
    else
      render new_message_link_path(@message), status: :unprocessable_entity
    end
  end

  def destroy
    @link = @message.links.find(params[:id])
    @link.destroy
    redirect_to @message, notice: "リンクを削除しました"
  end

  private

  def set_message
    @message = Message.find(params[:message_id])
  end
end
