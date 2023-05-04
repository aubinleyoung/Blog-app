class Like < ApplicationRecord
  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
