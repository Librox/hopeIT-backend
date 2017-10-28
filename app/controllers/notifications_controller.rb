# frozen_string_literal: true

class NotificationsController < ApplicationController
  def new
    @donors = Donor.all
    @notification = Notification.new
  end

  def create
    @notification = Notification.from_hash(notification_params)
    ids = params[:donors] || Donor.pluck(&:id)
    ids.each do |id|
      Pusher.trigger("user-notifications-#{id}", 'new-notification', notification_text: I18n.t("incoming_message", title: @notification.title),
                                                                     title: @notification.title,
                                                                     message: @notification.content)
    end
    redirect_to new_notification_path
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :content)
  end
end
