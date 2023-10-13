# spec/features/post_show_spec.rb

require 'rails_helper'

RSpec.feature 'Post Show Page', type: :feature do
  before do
    # Create a user
    @user = User.create(name: 'Alice-F', posts_counter: 2)
    @user1 = User.create(name: 'Alice', posts_counter: 2)

    # Create a post
    @post = Post.create(author: @user, title: 'My Post', text: 'This is the content of the post', comments_counter: 2,
                        likes_counter: 0)

    # Create some comments for the post
    @comments = []
    3.times do |i|
      @comments << Comment.create(author: @user1, post: @post, text: "Comment ##{i + 1}")
    end

    # Visit the post show page
    visit user_post_path(@user, @post) # Replace with your actual path
  end

  scenario 'Displays the post show page correctly' do
    # Verify that the post title contains the user's name
    expect(page).to have_content(@user.name)

    # Verify that the comments and likes counters are displayed
    expect(page).to have_content(@post.comments_counter)
    expect(page).to have_content(@post.likes_counter)
    expect(page).to have_content(@post.text)
    expect(page).to have_content(@post.title)

    # Verify the presence of the post content


    # Verify the presence of comments
    @comments.each_with_index do |comment, _idx|
      expect(page).to have_content(comment.text)
      User.all.each do |us|
        expect(page).to have_content(us.name) if comment.user_id == us.id
      end
    end
  end
end
