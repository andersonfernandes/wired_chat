# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, '#new', type: :controller do
  before { get(:new, session: { current_user_id: current_user_id }) }

  context 'when the user is not authenticated' do
    let(:current_user_id) { nil }

    it { expect(response).to render_template(:new) }
  end

  context 'when the user is already authenticated' do
    let(:current_user_id) { create(:user).id }

    it { expect(response).to redirect_to(root_path) }
  end
end
