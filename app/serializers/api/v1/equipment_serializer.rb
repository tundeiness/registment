class EquipmentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :photo

  def featured_image
    if object.photo.attached?
      {
        url: rails_blob_url(object.photo)
      }
    end
  end
end
