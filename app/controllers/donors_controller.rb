# frozen_string_literal: true

class DonorsController < ApplicationController
  def index
    @donors = Donor.all
  end

  def show
    @donor = Donor.find(params[:id])
    @messages = @donor.messages
  end

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor(params)
  end
end
