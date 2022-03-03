require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'tochi', photo: 'avatar.png', password: '123456789', email: 'yt@yahoo.com',
                            bio: 'test bio ', confirmed_at: Time.now
      @user2 = User.create! name: 'john', photo: 'avatar.png', password: '123456', bio: 'test bio 2',
                            email: 'gb@gmail.com', confirmed_at: Time.now

      visit new_user_session_path
      fill_in 'Email', with: 'yt@yahoo.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'

      @post1 = @user1.posts.create!(title: 'test title 1', text: 'test text 1', comments_counter: 0, likes_counter: 0)
      @post2 = @user1.posts.create!(title: 'test title 2', text: 'test text 2', comments_counter: 0, likes_counter: 0)
      @post3 = @user1.posts.create!(title: 'test title 3', text: 'test text 3', comments_counter: 0, likes_counter: 0)

      @comment1 = @post1.comments.create!(text: 'test comment 1', user_id: @user2.id)
      @comment2 = @post1.comments.create!(text: 'test comment 2', user_id: @user2.id)
      @comment3 = @post1.comments.create!(text: 'test comment 3', user_id: @user2.id)
      @like1 = @post1.likes.create!(user_id: @user1.id)

      click_on 'tochi'
      click_on 'See all posts'
      click_on "Post # #{@post1.id}"
    end

    it 'shows posts title' do
      expect(page).to have_content('test title 1')
    end

    it 'can see who wrote the post.' do
      expect(page).to have_content('tochi')
    end

    it 'can see how many comments a post has.' do
      expect(page).to have_content('Comments: 3')
    end

    it 'can see how many likes a post has.' do
      expect(page).to have_content('Likes: 1')
    end

    it 'can see some of the body for the post.' do
      expect(page).to have_content 'test text 1'
    end

    it 'can see the username of each commentor.' do
      expect(page).to have_content 'john'
    end

    it 'can see the comments of each commentor.' do
      expect(page).to have_content 'test comment 2'
    end
  end
end
