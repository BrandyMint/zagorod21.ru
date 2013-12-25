# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    house
    phone "1234567890"
    name 'name'
    money_amount 10000
    people_quantity 2
  end
end