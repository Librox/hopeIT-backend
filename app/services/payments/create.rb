# frozen_string_literal: true

module Payments
  class Create
    def initialize(donation:, payment_uuid:)
      @donation = donation
      @payment_uuid = payment_uuid
    end

    def call
      payment = build_payment

      if payment.save
        payment
      else
        false
      end
    end

    private

    attr_reader :donation, :payment_uuid

    def build_payment
      donation.build_payment.tap do |payment|
        payment.payment_uuid = payment_uuid
      end
    end
  end
end
