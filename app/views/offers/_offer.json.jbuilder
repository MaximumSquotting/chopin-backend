json.extract! offer, :id, :name, :description, :cost_per_person, :max_number_of_people, :user_id, :created_at, :updated_at
json.url offer_url(offer, format: :json)