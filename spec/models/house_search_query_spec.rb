require 'spec_helper'

describe HouseSearchQuery do

  let(:create_houses) do
    create :house, id: 1, resort: resort, category: category, price_bd: 1000, price_wd: 1500, capacity: 2
    create :house, id: 2, resort: resort, category: category, price_bd: 5000, price_wd: 6000, capacity: 10
    create :house, id: 3, resort: resort, category: category, price_bd: 6500, price_wd: 8100, capacity: 8
    create :house, id: 4, resort: resort, category: category, price_bd: 14000, price_wd: 22000, capacity: 2
  end
  let(:date_from) { '2013-12-06' }
  let(:date_to) { '2013-12-06' }
  let(:quantity) { 2 }

  context 'when any price' do
    let(:price_to) { '' }
    let(:expected_houses_ids) { [1,2,3,4] }

    search_test
  end

  context 'when price > 10000(max)' do
    let(:price_to) { 'max' }
    let(:expected_houses_ids) { [4] }

    search_test
  end

  context 'when price < 6000' do
    let(:price_to) { '6000' }

    context 'on weekday' do
      let(:expected_houses_ids) { [1,2] }
      search_test
    end

    context 'on weekend' do
      let(:date_from) { '2013-12-06' }
      let(:date_to) { '2013-12-08' }
      let(:expected_houses_ids) { [1] }
      search_test
    end
  end

  context 'when price < 8000 and capacity = 8' do
    let(:price_to) { '8000' }
    let(:quantity) { 8 }

    context 'on weekday' do
      let(:expected_houses_ids) { [2,3] }
      search_test
    end

    context 'on weekend' do
      let(:date_from) { '2013-12-06' }
      let(:date_to) { '2013-12-08' }
      let(:expected_houses_ids) { [2] }
      search_test
    end
  end

end
