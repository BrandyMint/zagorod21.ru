require 'spec_helper'

describe HousesController do
  before do
    City.stub(:default_city){FactoryGirl.create :city}
  end

  describe "#index" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "#show" do
    let(:house) { create :house }
    it "returns http success" do
      get 'show', id: house.id
      response.should be_success
    end
  end

  describe "#create" do
    let(:order_params){{house_id: FactoryGirl.create(:house).id}}

    it "returns http success" do
      get 'create', house_order: order_params
      response.should be_success
    end
  end

end
