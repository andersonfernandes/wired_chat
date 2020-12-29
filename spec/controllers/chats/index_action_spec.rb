require 'rails_helper'

RSpec.describe ChatsController, '#index', type: :controller do
  let(:current_user) { create(:user) }

  let(:user_01) { create(:user) }
  let(:user_02) { create(:user) }

  let(:chat_01) { create(:chat, category: :personal) }
  let(:user_chat_01) { create(:user_chat, user: current_user, chat: chat_01) }
  let(:user_chat_02) { create(:user_chat, user: user_01, chat: chat_01) }

  let(:chat_02) { create(:chat, category: :personal) }
  let(:user_chat_03) { create(:user_chat, user: current_user, chat: chat_02) }
  let(:user_chat_04) { create(:user_chat, user: user_02, chat: chat_02) }

  before do
    user_chat_01
    user_chat_02
    user_chat_03
    user_chat_04

    get(:index, session: { current_user_id: current_user.id })
  end

  it { expect(response).to render_template(:index) }
  it { expect(assigns(:chats)).to eq([chat_01, chat_02]) }
end
