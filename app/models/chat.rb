# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  category   :integer          not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chat < ApplicationRecord
  has_many :user_chats, inverse_of: :chat 
  has_many :users, through: :user_chats
  has_many :messages, inverse_of: :chat 

  enum category: %i[personal pool]

  validates :category, presence: true
  validates :name, presence: true, allow_blank: false, if: -> { pool? }
end
