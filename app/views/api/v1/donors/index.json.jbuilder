# frozen_string_literal: true

json.donors do
  json.array! donors, partial: "api/v1/donors/donor", as: :donor
end
