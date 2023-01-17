class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  def index
    @bookings = Booking.all
    # @bookings = current_user.bookings
  end

  def show
    render json: @booking, status: :ok
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      render json: @booking, status: :ok
    else
      render json: { data: @booking.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      render json: @booking, status: :ok
    else
      render json: { data: @booking.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end
  end

  def destory
    @booking = Booking.find(params[:id])

    if @booking.destory!
      render json: { message: 'Booking deleted', status: 'success' }, status: :ok
    else
      render json: { message: 'Something went wrong', status: 'failed' }
    end
  end

  private

  def set_booking
    # @booking = current_user.booking.find(params[:id])
    @booking = Booking.find(params[:id])
  # rescue ActiveRecord::RecordNotFound => e
  #   render json: e.message, status: :unauthorized
  end

  def booking_params
    params.require(:booking).permit(:status, :booking_date, :description, :pickup_date, :return_date, :booking_price, :user_id, :equipment_id)
  end

end
