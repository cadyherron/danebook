class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy


  validates :body, length: { in: 1..250 }


end
