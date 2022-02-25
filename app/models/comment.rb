class Comment < ApplicationRecord
  after_save :update_comments_counter

  belongs_to :post
  belongs_to :user

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
