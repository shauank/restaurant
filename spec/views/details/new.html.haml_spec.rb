require 'rails_helper'

RSpec.describe "details/new", type: :view do
  before(:each) do
    assign(:detail, Detail.new())
  end

  it "renders new detail form" do
    render

    assert_select "form[action=?][method=?]", details_path, "post" do
    end
  end
end
