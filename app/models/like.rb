class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
  after_save :update_likes_counter

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
