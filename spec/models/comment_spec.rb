require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment model' do
    user1 = User.new(name: 'tochi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'dog owner')
    post1 = Post.new(user: user1, title: 'my pst', text: 'new post')
    com1 = Comment.new(user: user1, post: post1, text: 'Comment1')
    com1.update_comments_counter

    it 'check if comment counter works' do
      curr = post1.comments_counter
      com2 = Comment.new(user: user1, post: post1, text: 'Comment2')
      com2.update_comments_counter
      expect(post1.comments_counter).to eq(curr + 1)
    end
  end
end
