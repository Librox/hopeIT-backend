# frozen_string_literal: true

class DonorsController < ApplicationController
  def index
    @donors = Donor.all
  end

  def show
    @donor = Donor.find(params[:id])
    @messages = @donor.messages
  end
end
