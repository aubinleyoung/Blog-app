class Comment < ApplicationRecord
  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
