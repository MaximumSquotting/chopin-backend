module Api::V1
  class PaymentsController < ApiController
    def index
    end

    def show
    end

    def create

    end

    private

    def payment_params
      params.require(:payment).permit(:user_id, :offer_id, :amount)
    end
  end
end
