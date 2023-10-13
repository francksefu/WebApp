require 'rails_helper'

RSpec.feature "User index page", type: :feature do
  before do
    #Create User
    @user1 = User.create(name: 'Franck', photo: 'pic', bio: 'Tio', posts_counter: 0)
    User.create(name: 'Gilson', photo: 'pic', bio: 'Tio', posts_counter: 0)
    User.create(name: 'Emma', photo: 'pic', bio: 'Tio', posts_counter: 0)
  end

  scenario "Display all usernames on the index page" do
    visit users_path

    User.all.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  scenario "Display all picture(mock) on the index page" do
    visit users_path

    User.all.each do |user|
      expect(page).to have_content(user.photo)
    end
  end

  scenario "Display all number of post on the index page" do
    visit users_path

    User.all.each do |user|
      expect(page).to have_content(user.posts_counter)
    end
  end

  scenario "Clicking user name redirects to the user's show page" do
    visit users_path

    find_link(@user1.name).click

    expect(page).to have_current_path(user_path(@user1))
  end
end