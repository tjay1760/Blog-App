require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(
    name: 'John Doe',
    photo: 'https://example.com/photos/johndoe',
    bio: 'Bio for John Doe',
    posts_counter: 2
  )

  describe 'custom validations' do
    it 'validates the presence of the name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'validates that posts_counter is an integer' do
      user.posts_counter = 'not-an-integer'
      expect(user).to_not be_valid
    end

    it 'validates that posts_counter is greater than or equal to zero' do
      user.posts_counter = -1
      expect(user).to_not be_valid
    end
  end

  describe 'custom methods' do
    it 'returns the most recent 3 posts' do
      expect(user.recent_posts).to eq(user.posts.last(3))
    end
  end
end
