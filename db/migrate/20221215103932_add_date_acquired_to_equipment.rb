class AddDateAcquiredToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :date_acquired, :date, null: false
  end
end
