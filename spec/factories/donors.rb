# frozen_string_literal: true

FactoryBot.define do
  factory :donor do
    sequence(:name) { |n| "Janusz Cebulski #{n}-y" }
    sequence(:email) { |n| "donor#{n}@example.com" }
  end
end
