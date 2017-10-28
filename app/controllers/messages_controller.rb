# frozen_string_literal: true

class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:id])
  end

  def new
    @donors = Donor.all
    @message = Message.new
  end

  def create
    @message = Message(params)
    if @message.save
      redirect_to :show
    else
      render :new
    end
  end
end
