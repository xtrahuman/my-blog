class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :Name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }
  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end
end
