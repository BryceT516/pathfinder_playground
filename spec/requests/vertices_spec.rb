require 'rails_helper'

RSpec.describe "Vertices", type: :request do
  describe "GET /vertices" do
    it "works! (now write some real specs)" do
      get vertices_path
      expect(response).to have_http_status(200)
    end
  end
end
