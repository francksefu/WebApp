require 'rails_helper'

RSpec.describe Post do
  subject = Post.new(author: User.first, title: 'love', text: 'Hello word', comments_counter: 10, likes_counter: 10)

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be exceed 250 char' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be greater than or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  # Create test for methods update_post_counter

  user = User.create(name: 'franck', photo: 'https', bio: 'bio', posts_counter: 10)
  describe '#update_post_counter' do
    it 'increments posts_counter of the author' do
      post = Post.new(author: user, title: 'love', text: 'Hello word')


      expect do
        post.update_post_counter
      end.to change { user.reload.posts_counter }.by(1)
    end
  end

  describe '#recent_comments' do
    it 'returns up to 5 recent comments' do
      post = Post.new(author: user, title: 'love', text: 'Hello word')
      comments = []

      # Create some comments associated with the post
      10.times do |i|
        # create(:comment, post: post, text: "Comment #{i}")
        comments << Comment.create(post:, author: user, text: "Comment #{i}")
      end

      recent_comments = post.recent_comments

      expect(recent_comments.length).to eq(5)
      expect(recent_comments[0].text).to eq(comments[9].text)
      expect(recent_comments[1].text).to eq(comments[8].text)
      expect(recent_comments[2].text).to eq(comments[7].text)
      expect(recent_comments[3].text).to eq(comments[6].text)
      expect(recent_comments[4].text).to eq(comments[5].text)
    end
  end
end
