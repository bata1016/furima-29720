FactoryBot.define do
  factory :item do
    name              { Faker::Name }
    price             { 300 }
    description       { 'No Content' }
    category_id       { 2 }
    delivery_fee_id   { 2 }
    delivery_date_id  { 2 }
    statement_id      { 2 }
    prefecture_id     { 2 }
    association :user
  end
end
