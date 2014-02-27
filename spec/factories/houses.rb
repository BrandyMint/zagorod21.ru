# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:title) {|n| "House_number#{n}"}

  factory :house do
    title
    description "MyText"
    price_bd 5
    price_wd 12
    price_bd_hour 1
    active true
    resort
  end
end
