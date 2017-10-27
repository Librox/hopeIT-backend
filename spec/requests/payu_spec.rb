# frozen_string_literal: true

RSpec.describe "PayU", type: :request do
  describe "POST /api/v1/payu/token" do
    let!(:donor) { FactoryBot.create(:donor, email: "herp@derp.in") }
    let!(:headers) {
      {
        ACCEPT: "application/json",
        CONTENT_TYPE: "application/json",
      }
    }
    let(:params) {
      {
        payu: {
          email: donor.email
        }
      }
    }
    it "returns 200 Created" do
      post api_v1_payu_token_path, headers: headers, params: params.to_json
      expect(response).to have_http_status(:ok)
    end

    it "matches the specified JSON schema" do
      post api_v1_payu_token_path, headers: headers, params: params.to_json
      expect(response).to match_response_schema("v1/payu_token", strict: true)
    end
  end
end
