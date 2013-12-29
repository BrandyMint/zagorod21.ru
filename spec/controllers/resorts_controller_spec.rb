require 'spec_helper'

describe ResortsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:resort_id){FactoryGirl.create(:resort).id}

    it "returns http success" do
      get 'show', id: resort_id
      response.should be_success
    end
  end

end
