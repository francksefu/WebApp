FactoryBot.define do
  factory :post do
    association :author, factory: :user
    title { 'Hired' }
    text { 'Franck' }
    comments_counter { 25 }
    likes_counter { 25 } # Example email
    # Add other attributes as needed
  end
end
