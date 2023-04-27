class CreateEquipmentConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment_conditions do |t|
      t.string :condition
      t.integer :count

      t.timestamps
    end
  end
end
