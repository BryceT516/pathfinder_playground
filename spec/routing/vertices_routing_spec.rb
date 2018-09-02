require "rails_helper"

RSpec.describe VerticesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vertices").to route_to("vertices#index")
    end

    it "routes to #new" do
      expect(:get => "/vertices/new").to route_to("vertices#new")
    end

    it "routes to #show" do
      expect(:get => "/vertices/1").to route_to("vertices#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vertices/1/edit").to route_to("vertices#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/vertices").to route_to("vertices#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vertices/1").to route_to("vertices#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vertices/1").to route_to("vertices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vertices/1").to route_to("vertices#destroy", :id => "1")
    end

  end
end
