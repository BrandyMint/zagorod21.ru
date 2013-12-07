# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :add_position_to_service, :class => 'AddPositionToServices' do
    position 1
  end
end
