class EquipmentConditionSerializer < ActiveModel::Serializer
  attributes :id, :condition, :num, :equipment_id
end