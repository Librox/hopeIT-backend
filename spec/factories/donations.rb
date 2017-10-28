# frozen_string_literal: true

FactoryBot.define do
  factory :donation do
    amount 1000
    association :donation_type
    association :donor
    association :patient
  end
end
