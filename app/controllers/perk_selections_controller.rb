class PerkSelectionsController < ApplicationController
  before_action :set_perk_selection, only: [:destroy]

  respond_to :json, only: [:create, :destroy]

  # GET /perk_selections
  def index
    @perk_selections = current_user.perk_selections
  end

  # POST /perk_selections/create
  def create
    @perk_selection = PerkSelection.new(perk_selection_params)

    if @perk_selection.save
      render json: {request: 'success',
                    perk_selection_id: @perk_selection.id}
    else
      render json: {request: 'failed'}
    end
  end

  # DELETE /perk_selections/:id
  def destroy
    @perk_selection.destroy

    render json: {request: 'success'}
  end

  private
    def set_perk_selection
      @perk_selection = PerkSelection.find(params[:id])
    end

    def perk_selection_params
      params.require(:perk_selection).permit(:user_id, :perk_id)
    end
end
