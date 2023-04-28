class Api::V1::EquipmentConditionsController < ApplicationController
  load_and_authorize_resource
  def index
    equipment_conditions = EquipmentCondition.all
    render json: { equipment_conditions: equipment_conditions }
  end

  def count_by_condition
    condition_count = EquipmentCondition.find_by(condition: params[:condition]).count
    render json: { count: condition_count }
  end
end
