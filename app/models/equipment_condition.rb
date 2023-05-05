class EquipmentCondition < ApplicationRecord
  belongs_to :equipment

  validates :num, presence: true
  validates :condition, presence: true
end
