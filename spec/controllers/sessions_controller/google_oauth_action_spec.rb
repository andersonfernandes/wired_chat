# frozen_string_literal: true

describe SessionsController, '#google_oauth', type: :controller do
  let(:omniauth_info) { OmniAuth.config.mock_auth[:google] }
  let(:google_oauth_action) { get(:google_oauth, session: {}) }

  before do
    request.env['omniauth.auth'] = omniauth_info
  end

  context 'with credentials to a new user' do
    it do
      expect { google_oauth_action }
        .to(change(User, :count).by(1))
    end

    it do
      google_oauth_action
      created_user = User.last
      expect(session[:current_user_id]).to eq(created_user.id)
    end
  end

  context 'with credentials to an existing user' do
    let(:user) { create(:user, email: omniauth_info.info.email) }

    before { user }

    it { expect { google_oauth_action }.not_to(change(User, :count)) }

    it do
      google_oauth_action
      expect(session[:current_user_id]).to eq(user.id)
    end
  end
end
