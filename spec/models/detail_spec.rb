require 'spec_helper'
require File.expand_path('../../app/models/detail.rb', __FILE__)

RSpec.describe Detail, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  context ".find_dataset" do
    let(:detail) { FactoryGirl.create(:detail) }
    it "return result based on name" do
      puts detail
    end
  end
end
