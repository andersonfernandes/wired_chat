# frozen_string_literal: true

describe SessionsController, '#destroy', type: :controller do
  before { delete :destroy }

  it { expect(session[:current_user_id]).to be_nil }
  it { expect(response).to redirect_to(login_path) }
end
