class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: :author_id, class_name: 'Post'
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  # validates :name, presence: true
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
