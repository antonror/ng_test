FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    confirmed_at { Time.now }
    password 'commonpass11'
  end
end
