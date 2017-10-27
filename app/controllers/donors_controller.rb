# frozen_string_literal: true

class DonorsController < ApplicationController
  def index
    @donors = Donor.all
  end
end
