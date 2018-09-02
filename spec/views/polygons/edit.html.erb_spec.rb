require 'rails_helper'

RSpec.describe "polygons/edit", type: :view do
  before(:each) do
    @polygon = assign(:polygon, Polygon.create!())
  end

  it "renders the edit polygon form" do
    render

    assert_select "form[action=?][method=?]", polygon_path(@polygon), "post" do
    end
  end
end
