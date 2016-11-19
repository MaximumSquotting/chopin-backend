class PaymentsController < ApplicationController
  before_action :authenticate_user!

  expose :payments, -> { Payment.all }
  expose :payment

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create

    respond_to do |format|
      if payment.save
        format.html { redirect_to payment, notice: 'Payment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if payment.update(payment_params)
        format.html { redirect_to payment, notice: 'Payment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
    end
  end

  private
    def payment_params
      params.require(:payment).permit(:user_id, :offer_id, :amount, :status)
    end
end
