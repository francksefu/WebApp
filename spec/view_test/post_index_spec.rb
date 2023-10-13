require 'rails_helper'

RSpec.feature "Post Index Page", type: :feature do
  before do
    # Create a user
    @user = User.create(name: 'Alice', posts_counter: 3)
    @posta = Post.create(author: @user, title: "Post franck", text: "This is the content of Post", comments_counter: 2, likes_counter: 0)
    
    # Create some posts for the user
    @posts = []
    3.times do |i|
      @posts << Post.create(author: @user, title: "Post ##{i + 1}", text: "This is the content of Post ##{i + 1}", comments_counter: 2, likes_counter: 0)
    end
    @comment_post0 = []
    @comment_post1 = []
    @comment_post2 = []
    2.times do |i|
        @comment_post0 << Comment.create(author: @user, post: @posts[0], text: "this is the comments #{i}")
    end
    2.times do |i|
        @comment_post1 << Comment.create(author: @user, post: @posts[1], text: "this is the comments #{i}")
    end

    2.times do |i|
        @comment_post2 << Comment.create(author: @user, post: @posts[2], text: "this is the comments #{i}")
    end
    
    # Visit the post index page
    visit user_posts_path(@user)  # Replace with your actual path
  end

  

  scenario "Displays the post index page correctly" do
    # Verify that the user's name is displayed
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.photo)

    # Verify that the number of posts is displayed
    expect(page).to have_content(@user.posts_counter)  # Update with the actual number
    
    # Verify the presence of each post on the page
    @posts.each_with_index do |post, idx|
        
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
        expect(page).to have_link(post.title, href: user_post_path(@user, post))
        # You can add checks for comments and likes counters if needed
    
    end
  end
  
  scenario "See the first comments on a post" do
    expect(page).to have_content(@comment_post0[0].text)
    expect(page).to have_content(@comment_post1[0].text)
    expect(page).to have_content(@comment_post2[0].text)
  end

  scenario "See number of comments and like on a post" do
    @posts.each do |p|
        expect(page).to have_content(p.comments_counter)
        expect(page).to have_content(p.likes_counter)
    end
  end

  scenario "See section of pagination" do
    expect(page).to have_css("#pagination-hide")
  end

  scenario "When I click on a post, it redirects me to that post's show page " do
    find_link(@posta.title).click

    expect(page).to have_current_path(user_post_path(@user, @posta))
  end
  

end
