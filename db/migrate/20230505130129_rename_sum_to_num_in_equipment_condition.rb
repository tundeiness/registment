class RenameSumToNumInEquipmentCondition < ActiveRecord::Migration[7.0]
  def change
    rename_column :equipment_conditions, :sum, :num
  end
end
