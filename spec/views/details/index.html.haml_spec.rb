require 'rails_helper'

RSpec.describe "details/index", type: :view do
  before(:each) do
    assign(:details, [
      Detail.create!(),
      Detail.create!()
    ])
  end

  it "renders a list of details" do
    render
  end
end
