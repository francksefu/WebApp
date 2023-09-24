require 'rails_helper'

RSpec.describe User do
  subject = User.new(name: 'franck', photo: 'https', bio: 'bio', posts_counter: 10)

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter must be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#recent_post' do
    it 'returns up to 3 recent posts' do
      usera = User.create(name: 'Tomy', photo: 'mok', bio: 'bio', posts_counter: 10)
      posts = []

      # Create some posts associated with the user
      5.times do |i|
        posts << Post.create(author: usera, title: "Post #{i}", comments_counter: 10, likes_counter: 10)
      end

      recent_posts = usera.recent_post

      expect(recent_posts.length).to eq(3)
      expect(recent_posts[0].title).to eq(posts[4].title)
      expect(recent_posts[1].title).to eq(posts[3].title)
      expect(recent_posts[2].title).to eq(posts[2].title)
    end
  end
end
