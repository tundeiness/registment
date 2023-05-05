class RenameCountToSumInEquipmentCondition < ActiveRecord::Migration[7.0]
  def change
    rename_column :equipment_conditions, :count, :sum
  end
end
