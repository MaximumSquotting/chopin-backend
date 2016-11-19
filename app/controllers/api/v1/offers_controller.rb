module Api::V1
  class OffersController < ApiController
    before_action :authenticate_user!, only: [:create, :update, :destroy]
    expose(:offers) { Offer.all }
    expose(:offer)

    def index
    end

    def show
    end

    def create
      offer.user = current_user
      if offer.save
        render "api/v1/offers/show", status: :created, location: offer
      else
        render json: offer.errors, status: :unprocessable_entity
      end
    end

    def update
    end

    def destroy
      offer.destroy
      head :no_content
    end

    private

    def offer_params
      params.require(:offer).permit(:name, :description, :cost_per_person, :max_number_of_people)
    end
  end
end
