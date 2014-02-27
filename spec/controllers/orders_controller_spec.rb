require 'spec_helper'

describe OrdersController do

  describe "#show" do

    let(:order){ create :house_order }

    it "returns http success" do
      get 'show', id: order.id
      response.should be_success
    end
  end

end
