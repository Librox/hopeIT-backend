# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    payment_uuid { SecureRandom.uuid }
    amount 1000
    status "pending"
    order_id { SecureRandom.uuid }
    association :donation

    trait :confirmed do
      status "completed"
    end
  end
end
