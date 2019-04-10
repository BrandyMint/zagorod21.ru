# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :resort do
    title { "MyString" }
    description { "MyText" }
    distance { "9.99" }
    time { "9.99" }
    map_iframe { "MyText" }
    city
  end
end
