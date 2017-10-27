# frozen_string_literal: true

FactoryBot.create_list(:donor, 15)
30.times do
  FactoryBot.create(:message, donor: Donor.all.sample)
end
