# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    name { 'John' } # Example name, replace with your desired attributes
    photo { 'http' }
    bio { 'bio' }
    posts_counter { 25 } # Example email
    # Add other attributes as needed
  end
end
