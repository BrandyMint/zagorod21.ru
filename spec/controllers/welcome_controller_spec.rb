require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    before do
      City.stub(:default_city){FactoryGirl.create :city}
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
