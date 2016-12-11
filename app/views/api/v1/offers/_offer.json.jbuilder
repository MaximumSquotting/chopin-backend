json.extract! offer, :id, :name, :description, :cost_per_person, :max_number_of_people, :user_id, :created_at, :updated_at, :address, :latitude, :longitude, :offer_date
json.url api_v1_offer_url(offer)
