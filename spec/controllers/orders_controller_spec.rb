require 'spec_helper'

describe OrdersController do

  describe "#show" do
    before do
      City.stub(:default_city){FactoryBot.create :city}
    end

    let(:order){ create :house_order }

    it "returns http success" do
      get 'show', id: order.id, search_form: {}
      response.should be_success
    end
  end

end
