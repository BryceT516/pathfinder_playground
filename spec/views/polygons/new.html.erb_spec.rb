require 'rails_helper'

RSpec.describe "polygons/new", type: :view do
  before(:each) do
    assign(:polygon, Polygon.new())
  end

  it "renders new polygon form" do
    render

    assert_select "form[action=?][method=?]", polygons_path, "post" do
    end
  end
end
