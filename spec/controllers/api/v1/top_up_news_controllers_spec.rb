require 'rails_helper'

RSpec.describe Api::V1::TopUpNewsController do
  describe "GET #index" do
    before do
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected recipe attributes" do
      hash_body = JSON.parse(response.body)
      expect(hash_body.keys).to match_array(%i[id ingredients instructions])
    end
  end
end
