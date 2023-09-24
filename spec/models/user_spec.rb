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
end
