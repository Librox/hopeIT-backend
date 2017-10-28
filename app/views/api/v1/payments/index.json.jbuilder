# frozen_string_literal: true

json.payments do
  json.array! payments, partial: "api/v1/payments/payment", as: :payment
end
