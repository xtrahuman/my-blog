require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'tochi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'has a dog')
  end

  before { subject.save }
  it 'Name Should be Present' do
    subject.posts_counter = 0
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Photo should be a string' do
    subject.posts_counter = 0
    subject.photo = 'photo source'
    expect(subject).to be_valid
  end

  it 'Posts counter should be equal or greater than zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
