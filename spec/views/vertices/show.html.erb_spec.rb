require 'rails_helper'

RSpec.describe "vertices/show", type: :view do
  before(:each) do
    @vertex = assign(:vertex, Vertex.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
