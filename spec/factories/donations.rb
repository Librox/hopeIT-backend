# frozen_string_literal: true

FactoryBot.define do
  factory :donation do
    association :donation_type
    association :donor
    association :patient
  end
end
