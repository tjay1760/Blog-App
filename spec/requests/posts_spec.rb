require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index', type: :request do
    user = User.create(
      name: 'test user',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'test_bio',
      posts_counter: 1
    )

    before(:example) { get "/users/#{user.id}/posts" }

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'displays a list of posts' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /show', type: :request do
    user = User.create(
      name: 'test user',
      photo: 'https://example.com/default-photo.jpg',
      bio: 'test_bio',
      posts_counter: 1
    )

    post = Post.create(
      author: user,
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 1,
      likes_counter: 1
    )

    before(:example) do
      get "/users/#{user.id}/posts/#{post.id}"
    end

    it 'renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'displays the post details for a given post' do
      expect(response).to have_http_status(200)
    end
  end
end
