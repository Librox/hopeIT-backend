# frozen_string_literal: true

json.extract! payment,
              :id,
              :amount,
              :status,
              :order_id,
              :payment_uuid
