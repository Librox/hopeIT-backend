# frozen_string_literal: true

module Donations
  class Create
    def initialize(donor:, patient_id:, amount:, donation_type_id:, payment_uuid:)
      @donor = donor
      @patient_id = patient_id
      @amount = amount
      @donation_type_id = donation_type_id
      @payment_uuid = payment_uuid
    end

    def call
      donation = build_donation

      if donation.save
        Payments::Create.new(donation: donation, payment_uuid: payment_uuid).call
        donation
      else
        false
      end
    end

    private

    attr_reader :donor, :patient_id, :donation_type_id, :amount, :payment_uuid

    def build_donation
      donor.donations.new.tap do |donation|
        donation.patient = patient
        donation.amount = amount
        donation.donation_type = donation_type
      end
    end

    def patient
      @patient ||= Patient.find(patient_id)
    end

    def donation_type
      @donation_type ||= DonationType.find(donation_type_id)
    end
  end
end
