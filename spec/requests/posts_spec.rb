require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'Testing the index' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
      expect(response).to be_successful
      expect(response.body).to include('<h1> All Posts </h1>')
    end

    it 'Testing show' do
      # Create a user record using FactoryBot

      post = create(:post)

      # Make a GET request to the show page for the created post
      get post_path(post)

      # Rest of your expectations
      expect(response).to have_http_status(200)
      expect(response).to be_successful
      expect(response.body).to include('<h1> Single Posts </h1>')
    end
  end
end
