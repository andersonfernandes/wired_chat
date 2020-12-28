require 'rails_helper'

RSpec.describe MessagesController, '#create', type: :controller do
  let(:current_user) { create(:user) }
  let(:create_action) do
    post :create, params: params, session: { current_user_id: current_user.id }
  end

  context 'with valid params' do
    let(:target) { create(:user) }
    let(:params) do
      {
        text: 'Hi there',
        target_type: target.class,
        target_id: target.id,
        sender_id: current_user.id
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
        target_type: nil,
        target_id: nil,
        sender_id: nil
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
