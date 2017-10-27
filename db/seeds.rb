# frozen_string_literal: true

FactoryBot.create_list(:administrator, 3)
FactoryBot.create_list(:donor, 15)
FactoryBot.create_list(:message, 30, administrator_id: rand(3) + 1, donor_id: rand(15) + 1)
