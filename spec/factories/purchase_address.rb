FactoryBot.define do
  factory :purchase_address do
    user_id {  FactoryBot.create(:user).id }
    item_id {  FactoryBot.create(:item).id }
    postcode { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 10) }
    city { Faker::Address.city }
    block { Faker::Address.street_name }
    building { Faker::Address.secondary_address }
    phone_number {Faker::Number.decimal_part(digits: 11)}
  end
end
