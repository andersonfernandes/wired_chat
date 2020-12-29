require 'rails_helper'

RSpec.describe UserChat, type: :model do
  it { should define_enum_for(:role).with_values(%i[admin member]) }

  describe 'validations' do
    it { should validate_presence_of(:role) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:chat) }
  end
end
