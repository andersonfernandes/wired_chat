# frozen_string_literal: true

quire 'rails_helper'

RSpec.describe ChatsController, '#show', type: :controller do
  let(:current_user) { create(:user) }

  let(:user) { create(:user) }

  let(:chat) { create(:chat, category: :personal) }
  let(:user_chat1) { create(:user_chat, user: current_user, chat: chat) }
  let(:user_chat2) { create(:user_chat, user: user, chat: chat) }

  before do
    user_chat1
    user_chat2

    get(:show, params: { id: chat.id }, session: { current_user_id: current_user.id })
  end

  it { expect(response).to render_template(:show) }
  it { expect(assigns(:chat)).to eq(chat) }
end
