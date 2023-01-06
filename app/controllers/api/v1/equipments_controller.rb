class Api::V1::EquipmentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_equipment, only: [:show, :destroy]
  # before_action :set_company, only: [:show, :update, :destroy]

  def index
    @equipments = Equipment.all
    render(json: @equipments)
    # render json: @equipments.map { |item|
    #   if item.photo.attached?
    #     item.as_json(only: :brand_name).merge(photo_path: url_for(item.photo))
    #   else
    #     item.as_json only: :brand_name
    #   end
    # }
  end

  def show
    @equipment = Equipment.find(params[:id])
    if @equipment.featured_image.attached? 
      render json: @equipment.as_json(only: %i[brand_name]).merge(featured_image_path: url_for(@equipment.avatar)), status: :ok
    else
      # render json: @equipments.as_json only: :brand_name # rubocop:disable Lint/Syntax
      render json: @equipment, status: :ok
    end
  end

  def create
    # @user = current_user
    @equipment = Equipment.new(equipment_params)
    # @equipment = current_user.equipment.new(equipment_params)
    if @equipment.save
      render json: @equipment, status: :created
    else
      render json: { errors: @equipment.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
      # render json: { errors: post.errors }, status: 400
    end
  end

  def update
    if @equipment.update(equipment_params)
      render json: @equipment, status: :ok
    else
      render json: { data: @equipment.errors.full_messages, status: 'failed' }, status: :unprocessable_entity
    end
  end

  def destory
    @equipment = Equipment.find(params[:id])

    if @equipment.destory!
      render json: { message: 'Equipment deleted', status: 'success' }, status: :ok
    else
      render json: { message: 'Something went wrong', status: 'failed' }
    end
  end


  private

  # def respond_to_equipment()
  #   if @equipment.valid?
  #     equipment_serializer = EquipmentSerializer.new(equipment: @equipment, user: @user.current_user)
  #     render json equipment_serializer.
  #   end
  # end

  def set_equipment
    # @equipment = cureent_user.equipment.find(params[:id])
    @equipment = Equipments.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    render json: error.message, status: :unauthorized
  end

  def equipment_params
    params.require(:equipment).permit(:brand_name, :featured_image, :serial_no, :condition, :date_acquired, :model_number, :description, :service_date, :supplier)
  end
end
