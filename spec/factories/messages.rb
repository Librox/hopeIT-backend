# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    donor nil
    administrator nil
    title "MyString"
    content "MyText"
  end
end
