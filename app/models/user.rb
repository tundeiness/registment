class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  ROLES = %w{super_admin admin user}

  has_many :bookings
  has_many :equipment, through: :bookings

  # has_many :equipments

  # def jwt_payload 
  #   super
  # end

  # has_many :bookings, class_name: 'Bookings', foreign_key: 'customer_id'
  # belongs_to :user, class_name: 'User', foreign_key: 'customer_id'

  ROLES.each do |name|
    define_method "#{name}?" do
      role == name
    end
  end
end
