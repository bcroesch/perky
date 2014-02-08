class PerksController < ApplicationController
  before_action :set_perk, only: [:show, :edit, :update, :destroy]

  respond_to :json, only: [:destroy]
  
  # GET /perks
  def index
    # USERS
    # ADMINS
  end

  # GET /perks/new
  def new
    # SUPERADMIN ONLY
  end

  # POST /perks/create
  def create
    # SUPERADMIN ONLY
  end

  # GET /perks/:id
  def show
    # NOT AVAILABLE?
  end

  # GET /perks/:id/edit
  def edit
    # SUPERADMIN ONLY
  end

  # PATCH/PUT /perks/:id
  def update
    # SUPERADMIN ONLY
  end

  # DELETE /perks/:id
  def destroy
    @perk.destroy
  end

  private
    def set_perk
      @perk = Perk.find(params[:id])
    end

    def perk_params
      params.require(:perk).permit(:name, :credits, :image, :description)
    end
end
