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
end
