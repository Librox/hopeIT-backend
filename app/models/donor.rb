# frozen_string_literal: true

class Donor < ApplicationRecord
  has_many :donations, dependent: :restrict_with_error
  has_many :payments, through: :donations
  has_many :patients, through: :donations
end
