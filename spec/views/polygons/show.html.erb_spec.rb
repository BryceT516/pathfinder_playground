require 'rails_helper'

RSpec.describe "polygons/show", type: :view do
  before(:each) do
    @polygon = assign(:polygon, Polygon.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
