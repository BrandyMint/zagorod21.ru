require 'spec_helper'

describe HousesController, type: :controller do
  before do
    City.stub(:default_city){ FactoryBot.create(:city) }
  end

  describe "#create" do
    let(:order_params){{house_id: FactoryBot.create(:house).id}}

    it "returns http success" do
      get 'create', params: { house_order: order_params }
      response.should be_successful
    end
  end

  describe "#index" do
    let(:resort) { create :resort, distance: 30 }
    let(:category) { create :category, name: 'All houses' }
    let(:city) { resort.city }

    before do
      create :house, resort: resort, category: category, price_bd: 1000, price_wd: 1500, capacity: 2
    end

    it "returns http success" do
      get 'index'
      response.should be_successful
    end
  end

  describe "#show" do
    let(:house) { create :house }
    it "returns http success" do
      get 'show', params: { id: house.id }
      response.should be_successful
    end
  end
end
