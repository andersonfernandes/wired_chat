# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id         :bigint(8)        not null, primary key
#  seen       :boolean          default(FALSE), not null
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  chat_id    :bigint(8)        not null
#  creator_id :bigint(8)        not null
#
# Indexes
#
#  index_messages_on_chat_id     (chat_id)
#  index_messages_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (chat_id => chats.id)
#  fk_rails_...  (creator_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: :messages
  belongs_to :chat, inverse_of: :messages

  validates :text, presence: true

  after_create_commit { broadcast_append_to chat, :messages }
  after_update_commit { broadcast_replace_to chat, :messages }
  after_destroy_commit { broadcast_remove_to chat, :messages }
end
