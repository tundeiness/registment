class Equipment < ApplicationRecord
  # belongs_to :user
  has_one_attached :photo
  validates :brand_name, :serial_no, :condition, :date_acquired, :supplier, :model_number, :description, presence: true
end
