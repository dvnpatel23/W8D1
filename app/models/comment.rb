class Comment < ApplicationRecord

  belongs_to :user

  belongs_to :post

  has_many :comments,
    foreign_key: :parent_comment_id,
    class_name: :Comment

  belongs_to :comment,
    optional: true,
    foreign_key: :parent_comment_id,
    class_name: :Comment



end
