# frozen_string_literal: true

class Donor < ApplicationRecord
  has_many :donations, dependent: :restrict_with_error
  has_many :payments, through: :donations
  has_many :patients, through: :donations
  has_many :messages, dependent: :restrict_with_error
end
