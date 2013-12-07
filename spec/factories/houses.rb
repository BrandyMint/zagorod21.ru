# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house do
    title "MyString"
    description "MyText"
    price_bd 5
    price_wd 12
    price_bd_hour 1
  end
end
