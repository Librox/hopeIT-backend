# frozen_string_literal: true

module Payments
  class Update
    def initialize(response:)
      @response = response
    end

    def call
      payment = update_payment

      if payment.save
        payment
      else
        false
      end
    end

    private

    attr_reader :response

    def update_payment
      payment = Payment.find_by(payment_uuid: response[:extOrderId])
      payment.tap do |p|
        p.amount = response[:totalAmount]
        p.status = response[:status]
        p.order_id = response[:orderId]
      end
    end
  end
end
