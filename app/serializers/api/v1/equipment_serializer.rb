class EquipmentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :brand_name, :serial_no, :condition, :date_acquired, :model_number, :description, :service_date, :supplier, :featured_image, :loan_status

  def featured_image
    if object.featured_image.attached?
      {
        url: rails_blob_url(object.featured_image)
      }
    end
  end
end
