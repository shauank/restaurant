require 'rails_helper'

RSpec.describe "details/edit", type: :view do
  before(:each) do
    @detail = assign(:detail, Detail.create!())
  end

  it "renders the edit detail form" do
    render

    assert_select "form[action=?][method=?]", detail_path(@detail), "post" do
    end
  end
end
