# frozen_string_literal: true

module Api
  module V1
    class PaymentsController < BaseController
      expose(:payments) { Payment.includes([:donation]).all }

      api :GET, "/v1/payments", "Get a list of payments"
      def index; end

      api :POST, "/v1/payments/payu", "Confirm payment"
      def payu
        # TODO: accept only from PayU IP addresses
        payment = Payments::Update.new(
          response: payu_params
        ).call

        if payment
          render "api/v1/payments/show", locals: { payment: payment }, status: :ok
        else
          render json: "Shit went wrong", status: :unprocessable_entity
        end
      end

      private

      def payu_params
        params.require(:order).permit!
      end
    end
  end
end
