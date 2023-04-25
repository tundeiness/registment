class Api::V1::EquipmentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_equipment, only: [:show, :destroy]

  def index
    @equipments = Equipment.all
    render(json: @equipments, include: :bookings)
  end

  def show
    @equipment = Equipment.find(params[:id])
    if @equipment.featured_image.attached? 
      render json: @equipment.as_json(only: %i[brand_name]).merge(featured_image_path: url_for(@equipment.avatar)), status: :ok
    else
      render json: @equipment, status: :ok
    end
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      render json: @equipment, status: :created
    else
      render json: { errors: @equipment.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end
  end

  def update
    if @equipment.update(equipment_params)
      render json: @equipment, status: :ok
    else
      render json: { data: @equipment.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end
  end

  def destroy
    @equipment = Equipment.find(params[:id])

    if @equipment.destroy!
      render json: { message: 'Equipment deleted', status: 'success' }, status: :ok
    else
      render json: { message: 'Something went wrong', status: 'failed' }
    end
  end

  def booking_count
    @equipment = Equipment.with_booking_count
    # render json: @equipment
    render json: { equipments: @equipments.as_json(except: [:created_at, :updated_at], methods: [:booking_count]) }
  end


  private

  def set_equipment
    # @equipment = cureent_user.equipment.find(params[:id])
    @equipment = Equipment.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e.message, status: :unauthorized
  end

  def equipment_params
    params.require(:equipment).permit(:brand_name, :featured_image, :serial_no, :condition, :date_acquired, :model_number, :description, :service_date, :supplier, :loan_status)
  end
end
