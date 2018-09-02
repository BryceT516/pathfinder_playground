require 'rails_helper'

RSpec.describe "vertices/new", type: :view do
  before(:each) do
    assign(:vertex, Vertex.new())
  end

  it "renders new vertex form" do
    render

    assert_select "form[action=?][method=?]", vertices_path, "post" do
    end
  end
end
