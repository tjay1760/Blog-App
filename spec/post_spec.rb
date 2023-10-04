require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(
    name: 'John Doe',
    photo: 'https://example.com/photos/johndoe',
    bio: 'Test bio for John Doe',
    posts_counter: 2
  )

  post = Post.new(
    author: user,
    title: 'Test Post Title',
    text: 'This is my test post content'
  )

  describe 'custom validations in Post' do
    it 'checks that the title is not empty' do
      post.title = ''
      expect(post).to_not be_valid
    end

# Assuming you have already defined `user` and `post` objects properly

it 'validates that the title does not exceed 200 characters' do
  # Attempt to set a title with more than 200 characters
  post.title = 'A' * 201

  # Expect the post to be invalid due to the title length validation
  expect(post).to_not be_valid

  # Optionally, you can also check for an error message on the specific attribute
  expect(post.errors[:title]).to include("is too long (maximum is 200 characters)")
end

    it 'validates that the comments counter is an integer' do
      post.comments_counter = 'not-an-integer'
      expect(post).to_not be_valid
    end

    it 'validates that the likes counter is an integer' do
      post.likes_counter = 'not-an-integer'
      expect(post).to_not be_valid
    end

    it 'validates that the likes counter is greater than or equal to zero' do
      expect(post.likes_counter).to be >= 0
    end

    it 'validates that the comments counter is greater than or equal to zero' do
      expect(post.comments_counter).to be >= 0
    end
  end

  describe 'custom methods in Post' do
    it 'updates the user post count' do
      expect do
        post.update_user_post_count
      end.to change(user, :posts_counter).by(1)
    end

    it 'gets the most recent 5 comments' do
      expect(post.recent_comments).to eq(post.comments.last(5))
      puts post.comments.last(5)
    end
  end
end
