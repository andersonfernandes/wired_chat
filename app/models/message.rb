# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  seen        :boolean          default(FALSE), not null
#  target_type :string           not null
#  text        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sender_id   :integer          not null
#  target_id   :integer          not null
#
# Indexes
#
#  index_messages_on_sender_id  (sender_id)
#
# Foreign Keys
#
#  sender_id  (sender_id => users.id)
#
class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :target, polymorphic: true

  validates :text, :target, :sender, presence: true
end
