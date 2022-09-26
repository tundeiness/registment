# t.string "brand_name", null: false
# t.string "serial_no", null: false
# t.string "condition", null: false
# t.date "date_acquired", null: false
# t.string "supplier", null: false
# t.string "model_number", null: false
# t.text "description", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false


class Equipment < ApplicationRecord
  # belongs_to :user
  has_one_attached :photo do |photo|
    photo.variant :thumbnail, resize_to_limit: [100, 100]
    photo.variant :medium, resize_to_limit: [400, 400]
  end
  validates :brand_name, :serial_no, :condition, :date_acquired, :supplier, :model_number, :description, presence: true
end
