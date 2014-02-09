class PurchasesController < ApplicationController

  # GET /purchases
  def index
    @account = current_user.account
  end

  # POST /purchases/create
  def create

  end

  private
    def purchase_params
      params.require(:purchase).permit(:kind, :perk_id, :user_id, :credits)
    end
end
