require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'Testing the index' do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response).to be_successful
      expect(response.body).to include('<h1> User </h1>')
    end

    it 'Testing show' do
      # Create a user record using FactoryBot
      user = create(:user) # Assuming you have a user factory set up

      # Make a GET request to the show page for the created user
      get user_path(user)

      # Rest of your expectations
      expect(response).to have_http_status(200)
      expect(response).to be_successful
      expect(response.body).to include('<h1>Show page</h1>')
    end
  end
end
