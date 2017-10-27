# frozen_string_literal: true

module Api
  module V1
    class DonationsController < BaseController
      expose(:donations) { Donation.all }
      expose(:donation)

      def_param_group :donation do
        param :donation, Hash, required: true do
          param :amount, Integer, required: true
          param :patient_id, Integer, required: true
          param :donation_type_id, Integer, required: true
        end
      end

      api :POST, "/v1/donations", "Create a new donation"
      param_group :donation
      def create
        tagged_logger { logger.info "Creating a new Donation" }
        donation = Donations::Create.new(
          donor: Donor.last,
          patient_id: donation_params[:patient_id],
          amount: donation_params[:amount],
          donation_type_id: donation_params[:donation_type_id],
        ).call

        if donation
          render "api/v1/donations/show", locals: { donation: donation }, status: :created
        else
          render json: "Unable to create your donation, please try again later", status: :unprocessable_entity
        end
      end

      private

      def donation_params
        params.require(:donation).permit(:amount,
                                         :patient_id,
                                         :donation_type_id)
      end
    end
  end
end
