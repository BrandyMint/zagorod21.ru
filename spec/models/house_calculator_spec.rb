require 'spec_helper'

describe HouseCalculator do
  let(:house) { double :house, resort: resort, price_wd: 1000, price_bd: 1500 }

  context 'when date_from == date_to and date_from is weekday' do
    let(:date_from) { '2013-12-06' }
    let(:date_to) { '2013-12-06' }
    let(:house_price) { house.price_bd }

    house_estimation_test
  end

  context 'when date_from == date_to and date_from is weekend' do
    let(:date_from) { '2013-12-07' }
    let(:date_to) { '2013-12-07' }
    let(:house_price) { house.price_wd }

    house_estimation_test
  end

  context 'when date_from is weekday and date_end is weekend with 1 day interval' do
    let(:date_from) { '2013-12-06' }
    let(:date_to) { '2013-12-07' }
    let(:house_price) { house.price_bd }

    house_estimation_test
  end

  context 'when date_from is weekday and date_end is weekend with 2 days interval' do
    let(:date_from) { '2013-12-06' }
    let(:date_to) { '2013-12-08' }
    let(:house_price) { house.price_bd + house.price_wd }

    house_estimation_test
  end

end
