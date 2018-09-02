require 'rails_helper'

RSpec.describe "polygons/index", type: :view do
  before(:each) do
    assign(:polygons, [
      Polygon.create!(),
      Polygon.create!()
    ])
  end

  it "renders a list of polygons" do
    render
  end
end
