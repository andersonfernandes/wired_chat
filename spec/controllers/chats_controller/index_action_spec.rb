# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatsController, '#index', type: :controller do
  let(:current_user) { create(:user) }

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  let(:chat1) { create(:chat, category: :personal) }
  let(:user_chat1) { create(:user_chat, user: current_user, chat: chat1) }
  let(:user_chat2) { create(:user_chat, user: user1, chat: chat1) }

  let(:chat2) { create(:chat, category: :personal) }
  let(:user_chat3) { create(:user_chat, user: current_user, chat: chat2) }
  let(:user_chat4) { create(:user_chat, user: user2, chat: chat2) }

  before do
    user_chat1
    user_chat2
    user_chat3
    user_chat4

    get(:index, session: { current_user_id: current_user.id })
  end

  it { expect(response).to render_template(:index) }
  it { expect(assigns(:chats)).to eq([chat1, chat2]) }
end
