class Api::V1::EquipmentConditionsController < ApplicationController
  load_and_authorize_resource
  def index
    equipment_conditions = EquipmentCondition.all
    render json: { equipment_conditions: equipment_conditions }
  end
end
