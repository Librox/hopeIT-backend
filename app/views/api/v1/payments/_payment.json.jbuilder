# frozen_string_literal: true

json.extract! payment,
              :id,
              :amount,
              :status,
              :order_id,
              :payment_uuid
json.patient_id payment.donation.patient_id
json.donation_type_id payment.donation.donation_type_id
