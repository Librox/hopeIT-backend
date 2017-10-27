# frozen_string_literal: true

class DonationType < ApplicationRecord
  has_many :donations, dependent: :restrict_with_error
end
