require 'rails_helper'

RSpec.describe "Polygons", type: :request do
  describe "GET /polygons" do
    it "works! (now write some real specs)" do
      get polygons_path
      expect(response).to have_http_status(200)
    end
  end
end
