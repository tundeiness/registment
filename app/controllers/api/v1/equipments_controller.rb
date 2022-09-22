class Api::V1::EquipmentsController < ApplicationController

  def index
    @equipments = Equipment.all
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
      render json: @equipments.as_json(only: %i[brand_name]).merge(photo_path: url_for(@equipments.avatar))
    else 
      render json: @equipments.as_json only: :brand_name # rubocop:disable Lint/Syntax
    end 
  end 

  private 

  def equipment_params
    params.require(:equipment).permit(:brand_name, :photo, :serial_no, :condition, :date_acquired, :supplied_by, :model_number, :description)
  end
end
