class EmailLeadsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:create]
  before_action :set_email_lead, only: [:show, :edit, :update, :destroy]

  # GET /email_leads
  # GET /email_leads.json
  def index
    @email_leads = EmailLead.all
  end

  # GET /email_leads/1
  # GET /email_leads/1.json
  def show
  end

  # GET /email_leads/new
  def new
    @email_lead = EmailLead.new
  end

  # GET /email_leads/1/edit
  def edit
  end

  # POST /email_leads
  # POST /email_leads.json
  def create
    @email_lead = EmailLead.new
    @email_lead.email = params[:email_leads_email]
    @email_lead.company_name = params[:email_leads_company_name]
    @email_lead.company_size = params[:email_leads_company_size]

    if @email_lead.save
      data = {}
      data['success'] = true
      render json: data
    else
      data = {}
      data['success'] = false
      render json: data
    end
  end

  # PATCH/PUT /email_leads/1
  # PATCH/PUT /email_leads/1.json
  def update
    respond_to do |format|
      if @email_lead.update(email_lead_params)
        format.html { redirect_to @email_lead, notice: 'Email lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @email_lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_leads/1
  # DELETE /email_leads/1.json
  def destroy
    @email_lead.destroy
    respond_to do |format|
      format.html { redirect_to email_leads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_lead
      @email_lead = EmailLead.find(params[:id])
    end

end
