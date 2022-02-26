require 'rails_helper'

RSpec.describe Post, type: :model do
  describe ' Post model testing' do
    user1 = User.new(name: 'tochi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                  bio: 'dog owner')
    post1 = Post.new(user: user1, title: 'my pst', text: 'new post')
    post1.comments_counter = 0
    post1.likes_counter = 0
    it 'post user should be testuser' do
      expect(post1.user).to be user1
    end

    it 'Title Should be Present' do
      post1.title = ''
      expect(post1).to_not be_valid
    end

    it 'Title Should have max 250 characters' do
      post1.title = 'post title'
      expect(post1).to be_valid
      post1.title = 'qwejfh ahfdo auhfoa ufoj jfaofu abhf ouabgf ioau faghfoau fgaofuga fouagfoaufga ouabgf
    fo uahoaufdadaydgaydgawudyawgdkuaydgajkdguyaydgadyadluaidyagdluiaygduiwygfdluiaydgaiudygailywdgailydga
    duahdiuawdghiauwgdh;iawudgy;iauydgh;aiuygwdiydugaiydgaludiaygdulaywfulidyauidyfguidagydiaduygaiydguaiyaugd'
      expect(post1).to_not be_valid
    end

    it 'likes counter should be equal or greater than zero' do
      post1.likes_counter = -1
      expect(post1).to_not be_valid
    end

    it 'comments counter should be equal or greater than zero' do
      post1.comments_counter = -1
      expect(post1).to_not be_valid
    end

  end
end