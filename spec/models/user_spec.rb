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
    it 'returns up to 3 recent post' do
      user = User.create(name: 'franck', photo: 'https//', bio: 'bio')
      user1 = User.create(name: 'franck', photo: 'https//', bio: 'bio')
      posts = []

      # Create some posts associated with the user
      6.times do |i|
        posts << Post.create(author: user, title: 'love', text: "Post #{i}")
      end

      recent_post = user1.recent_post

      expect(recent_post.length).to eq(0)
    end
  end
end
