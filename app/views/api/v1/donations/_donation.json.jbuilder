# frozen_string_literal: true

json.donation do
  json.extract! donation, :id, :amount, :donor_id, :donation_type_id, :created_at, :updated_at
  json.payment do
    donation.payment ? (json.extract! donation.payment, :id, :amount, :payment_uuid, :status, :created_at, :updated_at) : json.nil
  end
end
