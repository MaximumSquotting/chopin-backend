class PaymentsController < ApplicationController
  before_action :authenticate_user!

  expose :payments, -> { Payment.all }
  expose :payment

  # GET /payments
  # GET /payments.json
  def index
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create

    respond_to do |format|
      if payment.save
        format.html { redirect_to payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: payment }
      else
        format.html { render :new }
        format.json { render json: payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if payment.update(payment_params)
        format.html { redirect_to payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: payment }
      else
        format.html { render :edit }
        format.json { render json: payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def payment_params
      params.require(:payment).permit(:user_id, :offer_id, :amount, :status)
    end
end
