class Sub < ApplicationRecord
  validates :title, :description, :user_id, presence: true
  
  belongs_to :user
  has_many :postsubs
  has_many :posts,
  through: :postsubs,
  source: :post
  
end
