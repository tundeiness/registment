class RemoveServiceDateFromEquipment < ActiveRecord::Migration[7.0]
  def change
    remove_column :equipment, :service_date, :date
  end
end
