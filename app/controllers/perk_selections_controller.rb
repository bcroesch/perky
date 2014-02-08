class PerkSelectionsController < ApplicationController
  before_action :set_perk_selection, only: [:destroy]

  respond_to :json, only: [:destroy]

  # GET /perk_selections
  def index
    # USERS
  end

  # GET /perk_selections/new
  # def new
  #   # NOT AVAILABLE
  # end

  # POST /perk_selections/create
  def create
    
  end

  # GET /perk_selections/:id
  # def show
  #   # NOT AVAILABLE
  # end

  # GET /perk_selections/:id/edit
  # def edit
  #   # NOT AVAILABLE
  # end

  # PATCH/PUT /perk_selections/:id
  # def update
  #   # NOT AVAILABLE
  # end

  # DELETE /perk_selections/:id
  def destroy
    @perk_selection.destroy
  end

  private
    def set_perk_selection
      @perk_selection = PerkSelection.find(params[:id])
    end

    def perk_selection_params
      params.require(:perk_selection).permit(:user_id, :perk_id)
    end
end
