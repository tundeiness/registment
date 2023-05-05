class DropEquipmentConditionsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :equipment_conditions
  end

  def down
    create_table :equipment_conditions do |t|
      t.string :condition
      t.integer :num, default: 0
      t.timestamps
    end
  end
end
