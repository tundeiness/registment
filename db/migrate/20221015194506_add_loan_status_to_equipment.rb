class AddLoanStatusToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :loan_status, :string, default: 'available'
  end
end
