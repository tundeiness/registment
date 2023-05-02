class AddDefaultCountToEquipmentCondition < ActiveRecord::Migration[7.0]
  def change
    change_column :equipment_conditions, :count, :integer, default: 0
  end
end
