# frozen_string_literal: true

# == Schema Information
#
# Table name: user_chats
#
#  id         :bigint(8)        not null, primary key
#  role       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :bigint(8)        not null
#  user_id    :bigint(8)        not null
#
# Indexes
#
#  index_user_chats_on_chat_id  (chat_id)
#  index_user_chats_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (chat_id => chats.id)
#  fk_rails_...  (user_id => users.id)
#
class UserChat < ApplicationRecord
  belongs_to :user, inverse_of: :user_chats
  belongs_to :chat, inverse_of: :user_chats

  enum role: { admin: 0, member: 1 }

  validates :role, presence: true
end
