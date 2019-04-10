require 'spec_helper'

describe Api::OrdersController do
  describe "POST #estimate" do
    context 'lack of parameters for estimation' do
      it 'return error with message' do
          post :estimate, order: {}
          response.should be_successful
          response.body.should include('error')
        end
    end

    context 'proper estimable params' do
      let(:house){FactoryBot.create :house}
      let(:order_params){{
        house_id: house.id,
        date_from: Date.today,
        date_to: (Date.today + 5.day),
        people_quantity: 2,
        use_transport: '1',
        food_state: 'catering'
        }}

        it 'return success estimation' do
          post :estimate, order: order_params
          response.should be_successful
          response.body.should include('success')
        end
    end
  end
end