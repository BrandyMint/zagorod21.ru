require 'spec_helper'

describe ResortsController, type: :controller do
  describe "#index" do
    it "returns http success" do
      get 'index'
      response.should be_successful
    end
  end

  describe "#show" do
    let(:resort_id){FactoryBot.create(:resort).id}

    it "returns http success" do
      get 'show', params: { id: resort_id }
      response.should be_successful
    end
  end
end
