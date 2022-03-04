require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'tochi', photo: 'photo.png', password: '123456789', email: 'yt@yahoo.com',
                            bio: 'test bio', confirmed_at: Time.now
      visit new_user_session_path
      fill_in 'Email', with: 'yt@yahoo.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'

      @post1 = @user1.posts.create!(title: 'test title 1', text: 'test text 1', comments_counter: 0, likes_counter: 0)
      @post2 = @user1.posts.create!(title: 'test title 2', text: 'test text 2', comments_counter: 0, likes_counter: 0)
      @post3 = @user1.posts.create!(title: 'test title 3', text: 'test text 3', comments_counter: 0, likes_counter: 0)
      click_on 'tochi'
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

    it 'shows the bio for the user' do
      expect(page).to have_content('test bio')
      visit user_session_path
    end

    it 'Should see the first 3 posts for the user.' do
      expect(page).to have_content 'test title 1'
      expect(page).to have_content 'test title 2'
      expect(page).to have_content 'test title 3'
    end

    it 'Can see a button that lets me view all of a users posts' do
      expect(page).to have_content('See all post')
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s show page.' do
      click_link "Post # #{@post1.id}"
      expect(page).to have_current_path user_post_path(@user1, @post1)
    end

    it 'When I click to see all posts, it redirects me to the users posts index page.' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
