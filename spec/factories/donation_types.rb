# frozen_string_literal: true

FactoryBot.define do
  factory :donation_type do
    sequence(:name) { |n| "donationtype#{n}" }
  end
end
