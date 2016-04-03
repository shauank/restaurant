require 'spec_helper'

RSpec.describe "Details", type: :request do
  describe "GET /details" do
    it "Happy Path works! (now write some real specs)" do
      sign_in FactoryGirl.create(:user)
      get details_path
      expect(response).to have_http_status(200)
    end
  end
end
