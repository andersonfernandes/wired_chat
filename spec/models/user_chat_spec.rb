# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserChat, type: :model do
  it { is_expected.to define_enum_for(:role).with_values(%i[admin member]) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:role) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:chat) }
  end
end
