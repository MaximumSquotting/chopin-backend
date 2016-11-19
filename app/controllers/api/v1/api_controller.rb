module Api::V1
  class ApiController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def record_not_found
      render json: { errors: "Requested object not found" }, status: :not_found
    end
  end
end
