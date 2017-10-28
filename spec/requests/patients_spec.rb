# frozen_string_literal: true

RSpec.describe "Patients", type: :request do
  describe "GET /api/v1/patients" do
    let!(:patients) { FactoryBot.create_list(:patient, 3) }
    let!(:headers) {
      {
        ACCEPT: "application/json",
        CONTENT_TYPE: "application/json",
      }
    }
    it "returns 200 OK" do
      get api_v1_patients_path
      expect(response).to have_http_status(:ok)
    end

    it "matches the specified JSON schema" do
      get api_v1_patients_path
      expect(response).to match_response_schema("v1/patients", strict: true)
    end
  end
end
