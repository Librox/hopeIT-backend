# frozen_string_literal: true

module Api
  module V1
    class DonorsController < BaseController
      expose(:donors) { Donor.all }

      api :GET, "/v1/donors", "List all donors"
      def index; end
    end
  end
end
