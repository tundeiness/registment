class EquipmentCondition < ApplicationRecord
  belongs_to :equipment

  validates :count, presence: true
  validates :condition, presence: true
end
