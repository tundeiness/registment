class AddServiceDateToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :service_date, :date
  end
end
