class Api::V1::EquipmentsController < ApplicationController
  load_and_authorize_resource
  # before_action :set_company, only: [:show, :update, :destroy]

  def index
    @equipment ||= Equipments.all
    render json: @equipments.map { |item|
      if item.photo.attached?
        item.as_json(only: :brand_name).merge(photo_path: url_for(item.photo))
      else
        item.as_json only: :brand_name
      end
    }
  end

  def show
    @equipment = Equipments.find(params[:id])
    if @equipment.photo.attached? 
      render json: @equipment.as_json(only: %i[brand_name]).merge(photo_path: url_for(@equipment.avatar)), status: :ok
    else
      # render json: @equipments.as_json only: :brand_name # rubocop:disable Lint/Syntax
      render json: @equipment, status: :ok
    end
  end

  def create
    @equipment = Equipments.new(equipment_params)
    if @equipment.save
      render json: @equipment, status: :created
    else
      render json: { errors: @equipment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destory
    if @equipment.destory
      render json: { data: 'Equipment deleted', status: 'success' }, status: :ok 
    else
      render json: { data: 'Something went wrong', status: 'failed' }
    end
  end

  private

  def set_equipment
    # @equipment = cureent_user.equipment.find(params[:id])
    @equipment = Equipments.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    render json: error.message, status: :unauthorized
  end

  def equipment_params
    params.require(:equipments).permit(:brand_name, :photo, :serial_no, :condition, :date_acquired, :supplied_by, :model_number, :description, :service_date, :supplier)
  end
end
