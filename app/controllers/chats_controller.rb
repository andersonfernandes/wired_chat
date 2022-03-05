# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :authenticate!

  def index
    @chats = current_user.ordered_chats
  end

  def show
    @chat = Chat.includes(messages: :creator).find(params[:id])
  end
end
