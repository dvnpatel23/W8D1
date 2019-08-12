class Post < ApplicationRecord
  validates :title, :user_id, presence: true

  has_many :postsubs
  
  has_many :subs,
    through: :postsubs,
    source: :sub
  
  belongs_to :user

  has_many :comments
  


end
