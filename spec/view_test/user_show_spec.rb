require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  before do
    # Create User
    @user1 = User.create(name: 'Franck', photo: 'pic', bio: 'Tio', posts_counter: 0)
    @post1 = Post.create(author: @user1, title: 'Hello0', text: 'Allo allo', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user1, title: 'Hello1', text: 'Allo allo', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user1, title: 'Hello2', text: 'Allo allo', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user1, title: 'Hello3', text: 'Allo allo', comments_counter: 0, likes_counter: 0)
  end

  scenario 'Display all usernames on the index page' do
    visit user_path(@user1)

    expect(page).to have_content(@user1.name)
  end

  scenario 'Display all picture(mock) on the index page' do
    visit user_path(@user1)

    expect(page).to have_content(@user1.photo)
  end

  scenario 'Display all number of post' do
    visit user_path(@user1)

    expect(page).to have_content(@user1.posts_counter)
  end

  scenario 'Display Bio ' do
    visit user_path(@user1)

    expect(page).to have_content(@user1.bio)
  end

  scenario 'Count number of recent_post and check the button' do
    visit user_path(@user1)
    @i = 0
    @user1.recent_post.each do |_post|
      @i += 1
    end
    expect(@i).to eq(3)
    expect(page).to have_button('See all')
  end

  scenario "When I click a user's post, it redirects me to that post's show page " do
    visit user_path(@user1)
    find_link(@post1.title).click

    expect(page).to have_current_path(user_posts_path(@user1, @post1))
  end



  scenario "When I click to see all posts, it redirect me to the user's posts index page " do
    visit user_path(@user1)
    find_button('See all').click

    expect(page).to have_current_path(user_path(@user1))
  end
end
