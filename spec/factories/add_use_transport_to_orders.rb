# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :add_use_transport_to_order, :class => 'AddUseTransportToOrders' do
    use_transport false
  end
end
