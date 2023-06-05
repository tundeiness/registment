class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: %i[show update destroy]
  load_and_authorize_resource

  def index
    @bookings = Booking.all
    render(json: @bookings)
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

  def destroy
    @booking = Booking.find(params[:id])

    if @booking.destroy!
      render json: { message: 'Booking deleted', status: 'success' }, status: :ok
    else
      render json: { message: 'Something went wrong', status: 'failed' }
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:id, :status, :booking_date, :description, :pickup_date, :return_date, :booking_price, :user_id, :equipment_id)
  end
end
