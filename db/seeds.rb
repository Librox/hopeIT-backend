# frozen_string_literal: true

donors = FactoryBot.create_list(:donor, 10)
patients = FactoryBot.create_list(:patient, 3)
donations = []
donors.each do |donor|
  patients.each do |patient|
    donations += FactoryBot.create_list(:donation, 5, donor: donor, patient: patient)
  end
end
donations.each do |donation|
  FactoryBot.create(:payment, :confirmed, donation: donation)
end
FactoryBot.create_list(:admin, 3)
30.times do
  FactoryBot.create(:message, donor: Donor.all.sample)
end
