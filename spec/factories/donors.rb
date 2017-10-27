# frozen_string_literal: true

FactoryBot.define do
  factory :donor do
    name "MyString"
    sequence(:email) { |n| "donor#{n}@example.com" }
  end
end
