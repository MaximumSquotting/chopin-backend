class OffersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  expose :offers, ->{ Offer.includes(:user).all }
  expose :offer, find: ->(id, scope){ scope.includes(:user).find(id) }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    offer.user = current_user

    respond_to do |format|
      if offer.save
        format.html { redirect_to offer, notice: 'Offer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if offer.update(offer_params)
        format.html { redirect_to offer, notice: 'Offer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
    end
  end

  private
    def offer_params
      params.require(:offer).permit(:name, :description, :cost_per_person, :max_number_of_people, :user_id, :address, :latitude, :longitude, :OfferDate)
    end
end
