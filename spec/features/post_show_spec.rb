require 'rails_helper'

RSpec.describe 'Post show' do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://picsum.photos/id/23/200', bio: 'web developer',
                        posts_counter: 0)
    @post1 = Post.create(author_id: @user.id, title: 'Hello', text: 'this is my first post', likes_counter: 0,
                         comments_counter: 0)
    @post2 = Post.create(author_id: @user.id, title: 'Hello ', text: 'this is my second post', likes_counter: 0,
                         comments_counter: 0)
    @post3 = Post.create(author_id: @user.id, title: 'there', text: 'dadd', likes_counter: 0, comments_counter: 0)
    @comment = Comment.create(user_id: @user.id, post_id: @post1.id, text: 'first comment')
    @comment2 = Comment.create(user_id: @user.id, post_id: @post1.id, text: 'second comment')
    @like = Like.create(user_id: @user.id, post_id: @post1.id)
    visit user_post_path(@user.id, @post1.id)
  end

  it 'see the post title' do
    expect(page).to have_content('Hello')
  end

  it 'see who wrote the post' do
    expect(page).to have_content('Tom')
  end

  it 'see how many comments it has' do
    expect(page).to have_content('comments: 2')
  end

  it 'see how many likes it has' do
    expect(page).to have_content('Likes: 1')
  end

  it 'see the post body' do
    expect(page).to have_content('Home')
  end

  it 'see the username of each commentor' do
    expect(page).to have_content(@comment.user.name)
    expect(page).to have_content(@comment2.user.name)
  end

  it 'see the comment of each commentor left' do
    expect(page).to have_content(@comment.text)
    expect(page).to have_content(@comment2.text)
  end
end
