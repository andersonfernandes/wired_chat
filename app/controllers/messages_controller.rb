class MessagesController < ApplicationController
  before_action :authenticated?

  def create
    @message = Message.new(message_params)
    @message.save

    redirect_to root_path
  end

  private

  def message_params
    params.permit(:text, :target_type, :target_id, :sender_id)
  end
end
