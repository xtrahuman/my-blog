class Like < ApplicationRecord
  after_save :update_likes_counter

  belongs_to :post
  belongs_to :user

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
