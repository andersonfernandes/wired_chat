# == Schema Information
#
# Table name: user_chats
#
#  id         :integer          not null, primary key
#  role       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_user_chats_on_chat_id  (chat_id)
#  index_user_chats_on_user_id  (user_id)
#
# Foreign Keys
#
#  chat_id  (chat_id => chats.id)
#  user_id  (user_id => users.id)
#
class UserChat < ApplicationRecord
  belongs_to :user, inverse_of: :user_chats
  belongs_to :chat, inverse_of: :user_chats

  enum role: %i[admin member]

  validates :role, :chat, :user, presence: true
end
