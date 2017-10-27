# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    association :donor
    association :administrator
    sequence(:title) { |n| "Random title #{n}" }
    content "Bla bla lorem ipsum lorem ipsum lorem ipsum lorem ipsum"
  end
end
