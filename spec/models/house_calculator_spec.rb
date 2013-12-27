require 'spec_helper'

describe HouseCalculator do
  let(:resort) { double :resort, distance: 30 }
  let(:house) { double :house, resort: resort, price_wd: 1000, price_bd: 1500 }
  let(:quantity) { 12 }
  let(:food_state) { 'catering' }
  let(:date_from) { '2013-12-06' }
  let(:date_to) { '2013-12-07' }

  let(:form_object) { SearchForm.new food_state: food_state,
                      people_quantity: quantity,
                      use_transport: true,
                      date_from: date_from,
                      date_to: date_to }

  let(:calculator) { HouseCalculator.new house, form_object }
  let(:services) { Hashie::Mash.new transport: 20, food_inplace: 1500, food_catering: 350 } 

  before do
    Settings.stub(:services) { services }
  end

  subject { calculator.estimate }

  let(:result) { quantity*form_object.days*services.food_catering  + 2*resort.distance*services.transport + house.price_wd + house.price_bd }

  it { should be_a Estimation }
  its(:total) { should eq result }
end
