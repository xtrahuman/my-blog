require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  describe 'User' do
    before(:each) do
      @user1 = User.create! name: 'tochi', photo: 'photo.png', password: '123456789', email: 'yt@yahoo.com',
                            confirmed_at: Time.now
      @user2 = User.create! name: 'other user', photo: 'photo.png', password: '1234567', email: 'yt2@yahoo.com',
                            confirmed_at: Time.now
      visit new_user_session_path
      fill_in 'Email', with: 'yt@yahoo.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'
      visit root_path
    end

    it 'shows the username of other users' do
      expect(page).to have_content('tochi')
      expect(page).to have_content('other user')
    end

    it 'shows photo' do
      image = page.all('img')
      expect(image.size).to eql(2)
    end

    it 'shows number of posts for each user' do
      expect(page).to have_content('number of posts:0')
    end

    it 'show users page when clicked' do
      click_on 'tochi'
      expect(page).to have_current_path user_path(@user1)
    end
  end
end
