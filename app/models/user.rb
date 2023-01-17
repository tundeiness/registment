class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  attribute :role, :string, default: 'user'

  ROLES = %w{super_admin admin normal}.freeze

  has_many :bookings
  has_many :equipment, through: :bookings

  # has_many :equipments

  def jwt_payload
    super
  end

  ROLES.each do |name|
    define_method "#{name}?" do
      role == name
    end
  end
end
