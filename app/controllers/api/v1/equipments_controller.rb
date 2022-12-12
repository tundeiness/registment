class Api::V1::EquipmentsController < ApplicationController
  load_and_authorize_resource
  # before_action :set_company, only: [:show, :update, :destroy]

  def index
    @equipments ||= Equipment.all
    render json: @equipments.map { |item|
      if item.photo.attached?
        item.as_json(only: :brand_name).merge(photo_path: url_for(item.photo))
      else
        item.as_json only: :brand_name
      end
    }
  end

  def show
    @equipments = Equipment.find(params[:id])
    if @equipments.photo.attached? 
      render json: @equipments.as_json(only: %i[brand_name]).merge(photo_path: url_for(@equipments.avatar)), status: :ok
    else
      render json: @equipments.as_json only: :brand_name, status: :ok # rubocop:disable Lint/Syntax
    end
  end

  def create
    @equipment = equipment.new(equipment_params)
    if @equipment.save
      render json: @equipment, status: :ok
    else
      render json: { data: @equipment.errors.full_messages, status: "failed" },
        status: :unprocessable_entity
    end
  end

  private

  def set_equipment
    @equipment = cureent_user.equipment.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    render json: error.message, status: :unauthorized
  end

  def equipment_params
    params.require(:equipment).permit(:brand_name, :photo, :serial_no, :condition, :date_acquired, :supplied_by, :model_number, :description)
  end
end
