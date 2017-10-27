# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    association :donation
  end
end
