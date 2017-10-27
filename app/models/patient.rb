# frozen_string_literal: true

class Patient < ApplicationRecord
  has_many :donations, dependent: :restrict_with_error
  has_many :donors, through: :donations
end
