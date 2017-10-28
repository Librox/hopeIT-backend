# frozen_string_literal: true

json.patients do
  json.array! patients, partial: "api/v1/patients/patient", as: :patient
end
