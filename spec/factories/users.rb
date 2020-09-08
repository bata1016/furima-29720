FactoryBot.define do
  factory :user do
    last_name             { '山田' }
    first_name            { '花子' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'ハナコ' }
    nick_name             { Faker::Name.initials(number: 3) }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    email                 { Faker::Internet.free_email }
    birth_day             { '10161016' }
  end
end
