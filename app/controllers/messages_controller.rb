# frozen_string_literal: true

class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @donors = Donor.all
    @message = Message.new
  end

  def create
    admin = Admin.last
    ids = params[:donors] || Donor.pluck(:id)
    ActiveRecord::Base.transaction do
      records = ids.map { |id| Message.new(message_params.merge!(admin: admin, donor_id: id)) }
      records.each(&:save)
      ids.each do |id|
        Pusher.trigger("user-notifications-#{id}", 'new-message', notification_text: I18n.t("incoming_message", title: records.first.title),
                                                                  title: records.first.title,
                                                                  message: records.first.content)
      end
    end
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :donors, images: [])
  end
end
