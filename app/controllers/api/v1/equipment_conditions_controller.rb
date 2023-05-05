class Api::V1::EquipmentConditionsController < ApplicationController
  load_and_authorize_resource
  def index
    equipment_conditions = EquipmentCondition.all
    render json: { equipment_conditions: equipment_conditions }
  end

  def count_by_condition
    equipment_condition = EquipmentCondition.find_by(condition: params[:condition])
    if equipment_condition.present?
      render json: { num: equipment_condition.count }
    else
      render json: { error: 'condition not found' }, status: :not_found
    end
  end
end
