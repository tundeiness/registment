class EquipmentConditionSerializer < ActiveModel::Serializer
  attributes :id, :condition, :count, :equipment_id
end