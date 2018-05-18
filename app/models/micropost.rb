class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  #課題：Micropost のお気に入り機能  
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
end
