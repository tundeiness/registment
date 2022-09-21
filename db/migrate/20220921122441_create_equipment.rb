class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :brand_name, null: false
      t.string :serial_no, null: false
      t.string :condition, null: false
      t.date :date_acquired, null: false
      t.string :supplier, null: false
      t.string :model_number, null: false
      t.text :description, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
