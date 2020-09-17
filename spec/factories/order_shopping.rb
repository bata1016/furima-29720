FactoryBot.define do
  factory :order_shopping do
    token          {'tokentokentoken'}
    phone_number   {'09011221122'}
    postcode       {'123-4567'}
    city           {'京都市'}
    block          {'〇〇〇〇1-11'}
    building       {'abcマンション201'}
    prefecture_id  {2}
    association    :item
    association    :user
  end
end
