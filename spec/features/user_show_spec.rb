require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://picsum.photos/id/23/200', bio: 'web developer',
                        posts_counter: 0)
    @post1 = Post.create(author_id: @user.id, title: 'Hello', text: 'this is my first post', likes_counter: 0,
                         comments_counter: 0)
    @post2 = Post.create(author_id: @user.id, title: 'Hello ', text: 'this is my second post', likes_counter: 0,
                         comments_counter: 0)
    @post3 = Post.create(author_id: @user.id, title: 'there', text: 'dadd', likes_counter: 0, comments_counter: 0)
    visit user_path(@user.id)
  end

  it 'see the user profile picture' do
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/200']")
  end

  it 'see the user profile name' do
    expect(page).to have_content 'Tom'
  end

  it 'see the number of posts user has written' do
    expect(page).to have_content 'Number of posts: 3'
  end

  it 'see the user bio ' do
    expect(page).to have_content 'web developer'
  end

  it 'see the user first three posts ' do
    expect(page).to have_content('first post')
    expect(page).to have_content('second post')
  end

  it 'see the button that let me view all users posts' do
    expect(page).to have_link('See all posts')
  end

  it "When I click a user's post, it redirects me to that post's show page." do
    click_on 'there'
    expect(page).to have_content 'dadd'
  end

  it " When I click to see all posts, it redirects me to the user's post's index page. " do
    click_on 'See all posts', match: :first
    expect(page).to have_content 'Tom'
  end
end
