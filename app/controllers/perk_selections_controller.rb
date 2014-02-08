class PerkSelectionsController < ApplicationController
  before_action :set_perk_selection, only: [:destroy]

  # respond_to :json, only: [:destroy]

  # GET /perk_selections
  def index
    @perk_selections = current_user.perk_selections
  end

  # POST /perk_selections/create
  def create
    @perk_selection = PerkSelection.new(perk_selection_params)

    if @perk_selection.save
      flash[:success] = "Successfully selected this perk."
      redirect_to perk_selections_path
    else
      flash[:warning] = "There was an error selecting this perk."
      render action: "new"
    end

    redirect_to perk_selections_path
  end

  # DELETE /perk_selections/:id
  def destroy
    @perk_selection.destroy

    redirect_to perk_selections_path
  end

  private
    def set_perk_selection
      @perk_selection = PerkSelection.find(params[:id])
    end

    def perk_selection_params
      params.require(:perk_selection).permit(:user_id, :perk_id)
    end
end
