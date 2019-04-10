# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :booked_period do
    date_from "2013-12-29"
    date_to "2013-12-29"
    state_cd 1
  end
end
