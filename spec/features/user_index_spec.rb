require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://picsum.photos/id/23/200', bio: 'web developer',
                        posts_counter: 0)
    visit root_path
  end

  it 'shows the correct username' do
    expect(page).to have_content('Tom')
  end

  it 'shows the number of posts each user has written' do
    expect(page).to have_content('Number of posts')
  end

  it 'When I click on a user it should redirect to user/show page' do
    click_on 'Tom'
    expect(page).to have_content 'Tom'
  end

  it ' should return the correct css ' do
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/200']")
  end
end
