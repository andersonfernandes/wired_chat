require 'rails_helper'

RSpec.describe SessionsController, '#omniauth', type: :controller do
  let(:omniauth_info) { OmniAuth.config.mock_auth[:google] }
  before do
    request.env['omniauth.auth'] = omniauth_info
  end

  context 'with credentials to a new user' do
    it do
      expect { get(:google_oauth) }
        .to(change { User.count }.by(1))
    end
  end

  context 'with credentials to an existing user' do
    before { create(:user,  email: omniauth_info.info.email) }

    it do
      expect { get(:google_oauth) }
        .not_to(change { User.count })
    end
  end
end
