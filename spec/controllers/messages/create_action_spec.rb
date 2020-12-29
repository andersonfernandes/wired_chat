require 'rails_helper'

RSpec.describe MessagesController, '#create', type: :controller do
  let(:current_user) { create(:user) }
  let(:user) { create(:user) }
  let(:chat) do
    chat = create(:chat)
    create(:user_chat, user: current_user, chat: chat)
    create(:user_chat, user: user, chat: chat)
    chat
  end

  let(:create_action) do
    post :create, params: params, session: { current_user_id: current_user.id }
  end

  context 'with valid params' do
    let(:target) { create(:user) }
    let(:params) do
      {
        text: 'Hi there',
        creator_id: current_user.id,
        chat_id: chat.id
      }
    end 

    it do
      expect { create_action }
        .to change { Message.count }
        .by(1)
    end

    it do
      create_action
      expect(assigns(:message)).to be_a(Message)
    end
  end

  context 'with invalid params' do
    let(:params) do
      {
        text: '',
        creator_id: nil,
        chat_id: nil
      }
    end 

    it do
      expect { create_action }
        .not_to change { Message.count }
    end

    it do
      create_action
      expect(assigns(:message).errors.errors).not_to be_empty
    end
  end
end
