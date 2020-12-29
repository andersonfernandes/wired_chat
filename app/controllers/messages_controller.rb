class MessagesController < ApplicationController
  before_action :authenticate!

  def create
  end

  private

  def message_params
  end
end
