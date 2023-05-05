class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  # validations

  validates :title, presence: true, length: { maximu: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
