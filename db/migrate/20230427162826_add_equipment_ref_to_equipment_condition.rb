class AddEquipmentRefToEquipmentCondition < ActiveRecord::Migration[7.0]
  def change
    add_reference :equipment_conditions, :equipment, null: false, foreign_key: true
  end
end
