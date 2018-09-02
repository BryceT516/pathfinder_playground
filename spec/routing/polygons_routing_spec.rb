require "rails_helper"

RSpec.describe PolygonsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/polygons").to route_to("polygons#index")
    end

    it "routes to #new" do
      expect(:get => "/polygons/new").to route_to("polygons#new")
    end

    it "routes to #show" do
      expect(:get => "/polygons/1").to route_to("polygons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/polygons/1/edit").to route_to("polygons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/polygons").to route_to("polygons#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/polygons/1").to route_to("polygons#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/polygons/1").to route_to("polygons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/polygons/1").to route_to("polygons#destroy", :id => "1")
    end

  end
end
