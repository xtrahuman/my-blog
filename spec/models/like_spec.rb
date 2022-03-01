require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like model' do
    user1 = User.new(name: 'tochi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'dog owner')
    post1 = Post.new(user: user1, title: 'my pst', text: 'new post')
    like1 = Like.new(user: user1, post: post1)

    like1.update_likes_counter

    it 'check if likes counter works' do
      current = post1.likes_counter
      like2 = Like.new(user: user1, post: post1)
      like2.update_likes_counter
      expect(post1.likes_counter).to eq(current + 1)
    end
  end
end
