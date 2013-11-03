require "spec_helper"

describe ExtendsController do
  describe "routing" do

    it "routes to #index" do
      get("/extends").should route_to("extends#index")
    end

    it "routes to #new" do
      get("/extends/new").should route_to("extends#new")
    end

    it "routes to #show" do
      get("/extends/1").should route_to("extends#show", :id => "1")
    end

    it "routes to #edit" do
      get("/extends/1/edit").should route_to("extends#edit", :id => "1")
    end

    it "routes to #create" do
      post("/extends").should route_to("extends#create")
    end

    it "routes to #update" do
      put("/extends/1").should route_to("extends#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/extends/1").should route_to("extends#destroy", :id => "1")
    end

  end
end
