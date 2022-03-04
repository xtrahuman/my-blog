require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'tochi', photo: 'photo.png', password: '123456789', email: 'yt@yahoo.com',
                            bio: 'testing bio', confirmed_at: Time.now
      visit new_user_session_path
      fill_in 'Email', with: 'yt@yahoo.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'

      @post1 = @user1.posts.create!(title: 'test title 1', text: 'test text 1', comments_counter: 0, likes_counter: 0)
      @post2 = @user1.posts.create!(title: 'test title 2', text: 'test text 2', comments_counter: 0, likes_counter: 0)
      @post3 = @user1.posts.create!(title: 'test title 3', text: 'test text 3', comments_counter: 0, likes_counter: 0)

      @comment1 = @post1.comments.create!(text: 'test comment 1', user_id: @user1.id)
      @comment2 = @post1.comments.create!(text: 'test comment 2', user_id: @user1.id)
      @comment3 = @post1.comments.create!(text: 'test comment 3', user_id: @user1.id)
      @like1 = @post1.likes.create!(user_id: @user1.id)

      click_on 'tochi'
      click_on 'See all posts'
    end

    it 'shows the username of the user' do
      expect(page).to have_content('tochi')
    end

    it 'shows the photo for ther user' do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    it 'shows number of posts for the user' do
      expect(page).to have_content('number of posts3')
    end

    it 'shows posts title' do
      expect(page).to have_content('test title 1')
    end

    it 'can see some of the body for the post.' do
      expect(page).to have_content 'test text 1'
    end

    it 'can see the first comments on a post' do
      expect(page).to have_content 'test comment 1'
    end

    it 'can see how many comments a post has.' do
      expect(page).to have_content('Comments: 3')
    end

    it 'can see how many likes a post has.' do
      expect(page).to have_content('Likes: 1')
    end

    it 'When I click on a post, it redirects me to the show page for the post.' do
      click_link "Post # #{@post1.id}"
      expect(page).to have_current_path user_post_path(@user1.id, @post1.id)
    end
  end
end
