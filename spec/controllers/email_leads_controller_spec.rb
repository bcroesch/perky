require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EmailLeadsController do

  # This should return the minimal set of attributes required to create a valid
  # EmailLead. As you add validations to EmailLead, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "email" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EmailLeadsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all email_leads as @email_leads" do
      email_lead = EmailLead.create! valid_attributes
      get :index, {}, valid_session
      assigns(:email_leads).should eq([email_lead])
    end
  end

  describe "GET show" do
    it "assigns the requested email_lead as @email_lead" do
      email_lead = EmailLead.create! valid_attributes
      get :show, {:id => email_lead.to_param}, valid_session
      assigns(:email_lead).should eq(email_lead)
    end
  end

  describe "GET new" do
    it "assigns a new email_lead as @email_lead" do
      get :new, {}, valid_session
      assigns(:email_lead).should be_a_new(EmailLead)
    end
  end

  describe "GET edit" do
    it "assigns the requested email_lead as @email_lead" do
      email_lead = EmailLead.create! valid_attributes
      get :edit, {:id => email_lead.to_param}, valid_session
      assigns(:email_lead).should eq(email_lead)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EmailLead" do
        expect {
          post :create, {:email_lead => valid_attributes}, valid_session
        }.to change(EmailLead, :count).by(1)
      end

      it "assigns a newly created email_lead as @email_lead" do
        post :create, {:email_lead => valid_attributes}, valid_session
        assigns(:email_lead).should be_a(EmailLead)
        assigns(:email_lead).should be_persisted
      end

      it "redirects to the created email_lead" do
        post :create, {:email_lead => valid_attributes}, valid_session
        response.should redirect_to(EmailLead.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved email_lead as @email_lead" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmailLead.any_instance.stub(:save).and_return(false)
        post :create, {:email_lead => { "email" => "invalid value" }}, valid_session
        assigns(:email_lead).should be_a_new(EmailLead)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EmailLead.any_instance.stub(:save).and_return(false)
        post :create, {:email_lead => { "email" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested email_lead" do
        email_lead = EmailLead.create! valid_attributes
        # Assuming there are no other email_leads in the database, this
        # specifies that the EmailLead created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EmailLead.any_instance.should_receive(:update).with({ "email" => "MyString" })
        put :update, {:id => email_lead.to_param, :email_lead => { "email" => "MyString" }}, valid_session
      end

      it "assigns the requested email_lead as @email_lead" do
        email_lead = EmailLead.create! valid_attributes
        put :update, {:id => email_lead.to_param, :email_lead => valid_attributes}, valid_session
        assigns(:email_lead).should eq(email_lead)
      end

      it "redirects to the email_lead" do
        email_lead = EmailLead.create! valid_attributes
        put :update, {:id => email_lead.to_param, :email_lead => valid_attributes}, valid_session
        response.should redirect_to(email_lead)
      end
    end

    describe "with invalid params" do
      it "assigns the email_lead as @email_lead" do
        email_lead = EmailLead.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmailLead.any_instance.stub(:save).and_return(false)
        put :update, {:id => email_lead.to_param, :email_lead => { "email" => "invalid value" }}, valid_session
        assigns(:email_lead).should eq(email_lead)
      end

      it "re-renders the 'edit' template" do
        email_lead = EmailLead.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EmailLead.any_instance.stub(:save).and_return(false)
        put :update, {:id => email_lead.to_param, :email_lead => { "email" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested email_lead" do
      email_lead = EmailLead.create! valid_attributes
      expect {
        delete :destroy, {:id => email_lead.to_param}, valid_session
      }.to change(EmailLead, :count).by(-1)
    end

    it "redirects to the email_leads list" do
      email_lead = EmailLead.create! valid_attributes
      delete :destroy, {:id => email_lead.to_param}, valid_session
      response.should redirect_to(email_leads_url)
    end
  end

end