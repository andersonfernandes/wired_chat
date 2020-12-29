class MessagesController < ApplicationController
  before_action :authenticate!

  def create
    @message = Message.new(message_params)

    redirect_to chat_path(params[:chat_id]) if @message.save
  end

  private

  def message_params
    params.permit(:text, :creator_id, :chat_id)
  end
end
