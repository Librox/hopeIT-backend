# frozen_string_literal: true

module Payments
  class Create
    def initialize(donation:)
      @donation = donation
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

    attr_reader :donation

    def build_payment
      donation.build_payment.tap do |payment|
      end
    end
  end
end
