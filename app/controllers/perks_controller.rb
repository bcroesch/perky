class PerksController < ApplicationController
  before_action :set_perk, only: [:show, :edit, :update, :destroy]

  # respond_to :json, only: [:destroy]

  # GET /perks
  def index
    @perks = Perk.all 
    @prior_selections = current_user.perk_selections.to_json
  end

  # GET /perks/new
  def new
    # SUPERADMIN ONLY
    @perk = Perk.new
  end

  # POST /perks/create
  def create
    @perk = Perk.new(perk_params)

    if @perk.save
      flash[:success] = "Successfully created a new perk."
      redirect_to perks_path
    else
      flash[:warning] = "There was an error creating this perk."
      render action: "new"
    end
  end

  # GET /perks/:id
  def show
    # ALL USERS?
  end

  # GET /perks/:id/edit
  def edit
    # SUPERADMIN ONLY
  end

  # PATCH/PUT /perks/:id
  def update
    # SUPERADMIN ONLY

    if @perk
      flash[:success] = "Successfully updated this perk."
      redirect_to perks_path
    else
      flash[:warning] = "There was an error updating this perk."
      render action: "edit"
    end
  end

  # DELETE /perks/:id
  def destroy
    @perk.destroy

    redirect_to perks_path
  end

  private
    def set_perk
      @perk = Perk.find(params[:id])
    end

    def perk_params
      params.require(:perk).permit(:name, :credits, :image, :description)
    end
end
