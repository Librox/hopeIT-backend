# frozen_string_literal: true

module Api
  module V1
    class PatientsController < BaseController
      expose(:patients) { Patient.all }

      api :GET, "/v1/patients", "List all patients supported by fundation"
      def index; end
    end
  end
end
