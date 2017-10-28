# frozen_string_literal: true

module Api
  module V1
    class MessagesController < BaseController
      expose(:messages) { Message.all }
      api :GET, "/v1/messages", "Get list of all messages"
      def index; end
    end
  end
end
