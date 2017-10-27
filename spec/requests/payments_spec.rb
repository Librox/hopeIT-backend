# frozen_string_literal: true

RSpec.describe "Payments", type: :request do
  describe "POST /api/v1/payments/payu" do
    let!(:donor) { FactoryBot.create(:donor) }
    let!(:patient) { FactoryBot.create(:patient) }
    let!(:donation_type) { FactoryBot.create(:donation_type) }
    let!(:payment) { FactoryBot.create(:payment, payment_uuid: "testpaymentuuid") }
    let!(:headers) {
      {
        ACCEPT: "application/json",
        CONTENT_TYPE: "application/json",
      }
    }
    let(:params) {
      {
        order: {
          orderId: "123test123",
          extOrderId: payment.payment_uuid,
          totalAmount: 1000,
          status: "COMPLETED",
        }
      }
    }
    it "returns 200 Ok" do
      post api_v1_payments_payu_path, headers: headers, params: params.to_json
      expect(response).to have_http_status(:ok)
    end

    it "changes the associated payment status to completed" do
      expect(payment.status).to eq("pending")
      post api_v1_payments_payu_path, headers: headers, params: params.to_json
      expect(payment.reload.status).to eq("COMPLETED")
    end
  end
end
