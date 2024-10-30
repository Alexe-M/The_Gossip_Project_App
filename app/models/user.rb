class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :comments, dependent: :destroy
  has_many :private_messages_sent, class_name: 'PrivateMessage', foreign_key: 'sender_id'
  has_many :private_messages_received, class_name: 'PrivateMessage', foreign_key: 'receiver_id'
  has_many :likes, dependent: :destroy
  
end
