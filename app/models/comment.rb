class Comment < ApplicationRecord
  after_destroy :reduce_comments_counter
  after_save :update_comments_counter

  belongs_to :post
  belongs_to :user

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def reduce_comments_counter
    post.decrement!(:comments_counter)
  end
end
