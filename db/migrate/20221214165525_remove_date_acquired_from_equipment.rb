class RemoveDateAcquiredFromEquipment < ActiveRecord::Migration[7.0]
  def change
    remove_column :equipment, :date_acquired, :date
  end
end
