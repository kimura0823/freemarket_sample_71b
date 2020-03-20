FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {"0000000"}
    password_confirmation {"0000000"}
    first_name            {Faker::Name.first_name}
    last_name             {Faker::Name.last_name}
    first_name_kana       {Faker::Name.first_name}
    last_name_kana        {Faker::Name.last_name}
    birthday_y            {"1995"}
    birthday_m            {"5"}
    birthday_d            {"23"}

  end

end