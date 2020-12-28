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
  has_many :sent_messages, class_name: 'Message', inverse_of: :sender
  has_many :received_messages, class_name: 'Message', inverse_of: :target

  validates :email, uniqueness: { case_sensitive: false }
  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
