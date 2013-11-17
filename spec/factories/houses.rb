# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house do
    title "MyString"
    description "MyText"
    price_bd "9.99"
    price_wd "9.99"
    price_bd_hour "9.99"
  end
end
