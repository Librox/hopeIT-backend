# frozen_string_literal: true

class Administrator < ApplicationRecord
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable
  has_many :messages, dependent: :restrict_with_error
end
