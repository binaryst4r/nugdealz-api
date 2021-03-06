class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    user_id = params[:payment][:user_id]
    @user = User.find(user_id)
    deal_id = params[:payment][:deal_id]
    @deal = Deal.find(deal_id)
    dispensary_id = params[:payment][:dispensary_id]
    @dispensary = Dispensary.find(dispensary_id)
    respond_to do |format|
      if @payment.save_with_payment
        Redemption.create(user_id: user_id, deal_id: deal_id, dispensary_id: dispensary_id)
        @dispensary.complete_order_for(@deal)
        format.html { redirect_to user_url(@user), notice: 'You have successfully redeemed your deal, check your email for instructions.'}
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { redirect_to :back, notice: "Oops, that didn't work. Please try again." }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:stripe_card_token, :user_id, :amount, :deal_id, :charge_token, :card_last_4, :card_brand, :description, :created_at, :updated_at)
    end
end
