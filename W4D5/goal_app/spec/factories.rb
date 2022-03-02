FactoryBot.define do
  factory :user do
    username {Faker::Seinfeld.character}
    password {Faker::Seinfeld.character}
  end
end