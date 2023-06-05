class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # attribute :role, :string, default: 'user'

  # VALID_EMAIL_REGEX = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  ROLES = %w[super_admin admin normal].freeze

  attribute :role, :string, default: 'normal'

  has_many :bookings
  has_many :equipment, through: :bookings

  # has_many :equipments

  validates :first_name, :last_name, presence: true, length: { minimum: 3 }
  validates :phone, presence: true, length: { minimum: 7 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :address, presence: true, length: { in: 10..200 }
  validates :email, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: { case_sensetive: false }, format: { with: VALID_EMAIL_REGEX, multiline: true }


  ROLES.each do |name|
    define_method "#{name}?" do
      role == name
    end
  end

  def jwt_payload
    super
  end
end
