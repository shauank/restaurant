require "#{Rails.root}/app/services/detail_finder"


class DetailsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_detail, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, unless: [:index]

  respond_to :html

  def index
    puts current_user
    @filter = params[:detail_filter] || {}
    @details = Services::DetailFinder.find_dataset(@filter)
    respond_with(@details)
  end

  def show
    respond_with(@detail)
  end

  def new
    @detail = Detail.new
    respond_with(@detail)
  end

  def edit
  end
  
  def reserve
    user = User.first
    
  end
  
  def find_details
    Services::DetailFinder.find_dataset(params)
  end

  def create
    @detail = Detail.new(detail_params)
    @detail.save
    respond_with(@detail)
  end

  def update
    @detail.update(detail_params)
    respond_with(@detail)
  end

  def destroy
    @detail.destroy
    respond_with(@detail)
  end

  private
    def set_detail
      @detail = Detail.find_by_slug(params[:id])
    end

    def detail_params
      params.require(:detail).permit(:name, :hours_from, :hours_to, :price_from, :price_to, :photo)
    end
end
