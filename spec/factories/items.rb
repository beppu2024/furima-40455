FactoryBot.define do
  factory :item do
    item          {Faker::Name.initials(number: 3) }
    message       {Faker::Lorem.sentence(word_count: 1001)}
    category_id   {Faker::Number.between(from: 2, to: 10)}
    situation_id  {Faker::Number.between(from: 2, to: 10)}
    expense_id    {Faker::Number.between(from: 2, to: 10)}
    prefecture_id {Faker::Number.between(from: 2, to: 10)}
    until_day_id  {Faker::Number.between(from: 2, to: 10)}
    price         {Faker::Number.between(from: 300, to: 9_999_999)}

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end