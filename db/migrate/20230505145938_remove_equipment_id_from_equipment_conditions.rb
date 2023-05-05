class RemoveEquipmentIdFromEquipmentConditions < ActiveRecord::Migration[7.0]
  def change
    remove_column :equipment_conditions, :equipment_id, :bigint
    # remove_reference :equipment_conditions, :equipment, null: false, foreign_key: true
  end
end
