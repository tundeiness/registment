module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :first_name, :last_name, :email, :password, :address, :phone
      has_many :booking
      has_many :equipment
    end
  end
end
