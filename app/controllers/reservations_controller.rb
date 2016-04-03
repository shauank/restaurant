class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  respond_to :html

  def index
    @detail = Detail.find_by_slug(params[:detail_id])
    @reservations = @detail.reservations
    respond_with(@detail, @reservations)
  end

  def show
    @detail = Detail.find_by_slug(params[:detail_id])
    @reservations = @detail.reservations
    respond_with(@reservation)
  end

  def new
    @reservation = Reservation.new
    @reservation.detail = Detail.find_by_slug(params[:detail_id])
    respond_with(@reservation)
  end

  def edit
  end
  
  def confirm
    if current_user && params[:selected_card] 
      @reservation = Reservation.find_by_slug(params[:id])
      detail  = Detail.find_by_slug(params[:detail_id])
      
      
      amount = @reservation.seats * detail.per_head_charge
      response, transaction = current_user.purchase(params[:selected_card], amount)
      
      transaction.reservation = @reservation
      transaction.status = response.message
      
      transaction.save
      
      if response.success?
        @reservation.status = 'Success'
        @reservation.number = generate_reservation_number
      else
        @reservation.status = 'Failed'
      end
      
      @reservation.save
      
      respond_with(@reservation)
        
    end
  end
  
  def generate_reservation_number
    begin
      count = (count ||= 0) + 1        
      new_reservation_number = "#{(0...5).map { current_user.email.chars.to_a[rand(current_user.email.size)] }.join}-#{count}"
    end until (new_reservation_number and !(reservation = Reservation.find_by_number(new_reservation_number)))
    new_reservation_number
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.detail = Detail.find_by_slug(params[:detail_id])
    @reservation.user = current_user
    @reservation.status = 'Submitted'
    # response = current_user.purchase(params[:payment_id], params[:amount])
#     if response.success?
#       @reservation.save
#     end
    @reservation.save
    respond_with(@reservation.detail, @reservation)
  end

  def update
    @reservation.update(reservation_params)
    respond_with(@reservation.detail, @reservation)
  end

  def destroy
    detail = @reservation.detail
    @reservation.destroy
    # redirect_to :action => "index"
    redirect_to detail_reservations_path(detail, detail.reservations, format: :html)
    # respond_with(detail, detail.reservations)
  end

  private
    def set_reservation
      @reservation = Reservation.find_by_slug(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:seats, :reserved_date, :reserved_time)
    end
end
