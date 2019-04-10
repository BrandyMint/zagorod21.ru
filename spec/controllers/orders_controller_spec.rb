require 'spec_helper'

describe OrdersController, type: :controller do
  describe "#show" do
    before do
      City.stub(:default_city){FactoryBot.create :city}
    end

    let(:order){ create :house_order }

    it "returns http success" do
      get 'show', params: { id: order.id, search_form: {} }
      response.should be_successful
    end
  end
end
