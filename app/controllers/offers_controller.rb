class OffersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  expose :offers, ->{ Offer.all }
  expose :offer, find: ->(id, scope){ scope.includes(:user).find(id) }

  # GET /offers
  # GET /offers.json
  def index
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    offer.user = current_user

    respond_to do |format|
      if offer.save
        format.html { redirect_to offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: offer }
      else
        format.html { render :new }
        format.json { render json: offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if offer.update(offer_params)
        format.html { redirect_to offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: offer }
      else
        format.html { render :edit }
        format.json { render json: offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:name, :description, :cost_per_person, :max_number_of_people, :user_id)
    end
end
