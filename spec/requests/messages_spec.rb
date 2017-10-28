# frozen_string_literal: true

RSpec.describe "Donations", type: :request do
  describe "POST /api/v1/messages" do
    let!(:messages) { FactoryBot.create_list(:message, 10) }
    let!(:headers) {
      {
        ACCEPT: "application/json",
        CONTENT_TYPE: "application/json",
      }
    }
    it "returns 200 Ok" do
      get api_v1_messages_path, headers: headers
      expect(response).to have_http_status(:ok)
    end

    it "matches the specified JSON schema" do
      get api_v1_messages_path, headers: headers
      expect(response).to match_response_schema("v1/messages", strict: true)
    end
  end
end
