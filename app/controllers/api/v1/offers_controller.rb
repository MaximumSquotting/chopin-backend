module Api::V1
  class OffersController < ApiController
    before_action :authenticate_user!, only: [:create, :update, :destroy, :chipped_in]
    expose(:offers) { Offer.all }
    expose(:offer)
    expose(:my_offers) { current_user.offers }
    expose(:participated) { current_user.dinners.includes(:payments) }

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
      @offer = Offer.find(params[:id])
      if @offer.update(offer_params)
        render json: {status: :updated}
      end
    end

    def destroy
      offer.destroy
      head :no_content
    end

    def my
    end

    def chipped_in
    end

    private

    def offer_params
      params.require(:offer).permit(:name, :description, :cost_per_person, :max_number_of_people, :address, :latitude, :longitude, :OfferDate)
    end
  end
end
