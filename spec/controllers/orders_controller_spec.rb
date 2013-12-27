require 'spec_helper'

describe OrdersController do

  describe "GET 'create'" do
    let(:order_params){{house_id: FactoryGirl.create(:house).id}}

    it "returns http success" do
      get 'create', order: order_params
      response.should be_success
    end
  end

  describe "GET 'show'" do

    let(:order){ create :order }

    it "returns http success" do
      get 'show', id: order.id
      response.should be_success
    end
  end

end
