class Post < ApplicationRecord
  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
