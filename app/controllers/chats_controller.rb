class ChatsController < ApplicationController
  before_action :authenticate!

  def index
    @chats = current_user.ordered_chats
  end
end
