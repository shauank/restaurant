require 'rails_helper'

RSpec.describe "details/show", type: :view do
  before(:each) do
    @detail = assign(:detail, Detail.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
