# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :image do
    file { "MyString" }
    description { "MyText" }
  end
end
