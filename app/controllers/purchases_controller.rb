class PurchasesController < ApplicationController

  # GET /purchases
  def index
    # ADMIN
    # SUPERADMIN
  end

  # GET /purchases/new
  # def new
  #   # NOT AVIALABLE?
  # end

  # POST /purchases/create
  def create

  end

  # GET /purchases/:id
  # def show
  #   # NOT AVAILABLE?
  # end

  # GET /purchases/:id/edit
  # def edit
  #   # NOT AVAILABLE
  # end

  # PATCH/PUT /purchases/:id
  # def update
  #   # NOT AVAILABLE
  # end

  # DELETE /purchases/:id
  # def destroy
  #   # NOT AVAILABLE
  # end

  private
    def purchase_params
      params.require(:purchase).permit(:kind, :perk_id, :user_id, :credits)
    end
end
