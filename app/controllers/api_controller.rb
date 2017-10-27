# frozen_string_literal: true

class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render json: { errors: "Resource not found" }, status: :not_found
  end

  def tagged_logger
    logger.tagged("#{self.class.name}##{action_name}") { yield }
  end
end
