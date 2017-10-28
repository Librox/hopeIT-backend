# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApiController
      resource_description do
        api_version "1"
      end
    end
  end
end
