require File.expand_path('../../../app/services/detail_finder.rb', __FILE__)
require 'spec_helper'

describe Services::DetailFinder do  
  
  context ".find_dataset" do
    let(:detail) { FactoryGirl.create(:detail, price_from: 2000, price_to: 3000) }
    it "return result based on name" do
      params = {name: detail.name.slice(2,5)}
      finder = Services::DetailFinder.find_dataset(params)
      expect(finder.count).to equal(1)
    end
    
    it "return result based on price_from" do
      params = {price_from: detail.price_from - 100}
      finder = Services::DetailFinder.find_dataset(params)
      expect(finder.count).to equal(1)
    end
    
    it "return result based on price_to" do
      params = {price_to: detail.price_to + 500}
      finder = Services::DetailFinder.find_dataset(params)
      expect(finder.count).to equal(1)
    end
    
    it "return result based on price_from and price_to" do
      params = {price_from: detail.price_from - 100, price_to: detail.price_to + 500}
      finder = Services::DetailFinder.find_dataset(params)
      expect(finder.count).to equal(1)
    end
  end
end