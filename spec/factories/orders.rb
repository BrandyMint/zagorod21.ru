# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    house
    phone "1234567890"
    date_from { Date.today }
    date_to { Date.today + 1.day }
    name 'name'
    money_amount 10000
    people_quantity 2
  end
end
