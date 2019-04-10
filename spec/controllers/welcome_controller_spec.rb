require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    let(:resort) { create :resort, distance: 30 }
    let(:category) { create :category, name: 'All houses' }
    let(:city) { resort.city }

    before do
      City.stub(:default_city){FactoryBot.create :city}
      create :house, id: 1, resort: resort, category: category, price_bd: 1000, price_wd: 1500, capacity: 2
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
