# frozen_string_literal: true

RSpec.describe "Donations", type: :request do
  describe "POST /api/v1/donations" do
    let!(:donor) { FactoryBot.create(:donor) }
    let!(:patient) { FactoryBot.create(:patient) }
    let!(:donation_type) { FactoryBot.create(:donation_type) }
    let!(:headers) {
      {
        ACCEPT: "application/json",
        CONTENT_TYPE: "application/json",
      }
    }
    let(:params) {
      {
        donation: FactoryBot.attributes_for(:donation)
                            .merge!(donation_type_id: donation_type.id)
                            .merge!(patient_id: patient.id)
      }
    }
    it "returns 201 Created" do
      post api_v1_donations_path, headers: headers, params: params.to_json
      expect(response).to have_http_status(:created)
    end

    it "matches the specified JSON schema" do
      post api_v1_donations_path, headers: headers, params: params.to_json
      expect(response).to match_response_schema("v1/donations", strict: true)
    end
  end
end
