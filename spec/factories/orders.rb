# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :order, class: 'Order' do
    name 'name'
    phone "+7 (121) 231-23-12"
  end

  factory :house_order, parent: :order, class: 'HouseOrder' do
    house
    date_from Time.now
    date_to (Date.today + 1.day)
    money_amount 10000
    people_quantity 2
  end

  factory :food_order, parent: :order, class: 'FoodOrder' do
    date_from Time.now
  end

  factory :transport_order, parent: :order, class: 'TransportOrder' do
    date_from Time.now
    date_to (Date.today + 1.day)
  end
end
