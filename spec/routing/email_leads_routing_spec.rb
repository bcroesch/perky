require "spec_helper"

describe EmailLeadsController do
  describe "routing" do

    it "routes to #index" do
      get("/email_leads").should route_to("email_leads#index")
    end

    it "routes to #new" do
      get("/email_leads/new").should route_to("email_leads#new")
    end

    it "routes to #show" do
      get("/email_leads/1").should route_to("email_leads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/email_leads/1/edit").should route_to("email_leads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/email_leads").should route_to("email_leads#create")
    end

    it "routes to #update" do
      put("/email_leads/1").should route_to("email_leads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/email_leads/1").should route_to("email_leads#destroy", :id => "1")
    end

  end
end
