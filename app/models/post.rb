class Post < ApplicationRecord
  belongs_to :user

  def update_posts_counter
    user.increment!(:posts_counter)
  end

  def last_five_posts
    posts.order(created_at: :desc).limit(5)
  end
end
