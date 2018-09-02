require 'rails_helper'

RSpec.describe "vertices/index", type: :view do
  before(:each) do
    assign(:vertices, [
      Vertex.create!(),
      Vertex.create!()
    ])
  end

  it "renders a list of vertices" do
    render
  end
end
