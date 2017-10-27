# frozen_string_literal: true

FactoryBot.create_list(:donor, 15)
FactoryBot.create_list(:message, 30, donor_id: rand(15) + 1)
