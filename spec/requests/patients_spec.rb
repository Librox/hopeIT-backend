# frozen_string_literal: true

RSpec.describe "Patients", type: :request do
  describe "GET /api/v1/patients" do
    let!(:patients) { FactoryBot.create_list(:patient, 3) }
    it "returns 200 OK" do
      get api_v1_patients_path
      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema("v1/patients", strict: true)
    end
  end
end
