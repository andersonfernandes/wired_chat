# frozen_string_literal: true

describe Sessions::UpsertUser, type: :interactor do
  subject(:invoke_interactor) { described_class.call(auth_data: auth_data) }

  context 'when the user does not exists' do
    let(:auth_data) do
      OmniAuth::AuthHash.new(
        info: {
          email: 'doe@mail.com',
          name: 'John Dow'
        },
        credentials: OmniAuth::AuthHash.new(
          token: 'google-token'
        )
      )
    end

    it do
      expect { invoke_interactor }.to change(User, :count).by(1)
    end
  end

  context 'when the user exists' do
    let!(:user) { create(:user, image_url: 'http://old_image', name: 'Old Name') }
    let(:new_image_url) { 'http://new_image' }
    let(:new_name) { 'New Name' }
    let(:auth_data) do
      OmniAuth::AuthHash.new(
        info: {
          image: new_image_url,
          email: user.email,
          name: new_name
        },
        credentials: OmniAuth::AuthHash.new(
          token: 'google-token'
        )
      )
    end

    it do
      expect { invoke_interactor }.not_to change(User, :count)
    end

    it 'updates the the user attributes' do
      invoke_interactor
      expected_attributes = { email: user.email, image_url: new_image_url, name: new_name }

      expect(user.reload).to match(an_object_having_attributes(expected_attributes))
    end
  end
end
