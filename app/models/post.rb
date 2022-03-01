class Post < ApplicationRecord
  after_save :update_posts_counter

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  # private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
