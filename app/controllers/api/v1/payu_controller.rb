# frozen_string_literal: true

module Api
  module V1
    class PayuController < BaseController
      def_param_group :payu do
        param :payu, Hash, required: true do
          param :email, String, required: true
        end
      end
      api :POST, "/v1/payu/token", "Get mobile token for PayTouch"
      param_group :payu
      def token
        donor = Donor.find_by(email: payu_params[:email])
        response = HTTP.post(
          # "https://secure.payu.com/pl/standard/user/oauth/authorize",
          "https://secure.snd.payu.com/pl/standard/user/oauth/authorize",
          form: {
            grant_type: "trusted_merchant",
            scope: "mobile.sdk",
            client_id: 300_746,
            client_secret: "2ee86a66e5d97e3fadc400c9f19b065d",
            email: payu_params[:email],
            ext_customer_id: donor.id
          }
        )
        render json: response.to_s
      end

      private

      def payu_params
        params.require(:payu).permit(:email)
      end
    end
  end
end
