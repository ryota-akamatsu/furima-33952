FactoryBot.define do
  factory :user do
    nickname               {Faker::Name}
    email                  {Faker::Internet.free_email}
    password               {"aaaa1234"}
    password_confirmation  {"aaaa1234"}
    last_name              {"田中"}
    last_name_kana         {"タナカ"}
    first_name             {"太郎"}
    first_name_kana        {"タロウ"}
    birthday               {'1999-02-15'}
  end
end
