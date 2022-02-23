class Post < ApplicationRecord
  after_save :update_posts_counter

  belongs_to :user
  has_many :comments
  has_many :likes

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end
