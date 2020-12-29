# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string           not null
#  google_refresh_token :string
#  google_token         :string
#  image_url            :string
#  name                 :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class User < ApplicationRecord
  has_many :user_chats, inverse_of: :user
  has_many :chats, through: :user_chats
  has_many :messages, inverse_of: :creator

  validates :email, uniqueness: { case_sensitive: false }
  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def ordered_chats
    chats.includes(:messages).order('messages.created_at DESC')
  end
end
