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
  # accepts_nested_attributes_for :bookings, allow_destroy: true

  def jwt_payload
    super
  end

  # before_create :set_user_role

  # has_many :bookings, class_name: 'Bookings', foreign_key: 'customer_id'
  # belongs_to :user, class_name: 'User', foreign_key: 'customer_id'

  ROLES.each do |name|
    define_method "#{name}?" do
      role == name
    end
  end

  # def set_user_role
  #   self.role = 'user'
  # end
end
