class User < ActiveRecord::Base
  include SharedValidations
  include SharedPhonable
  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :claims
  has_many :employees
  has_many :offices, through: :employees

  mount_uploader :avatar, ::AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true

  def to_s
    name
  end

  def name
    "#{first_name} #{last_name}"
  end

  def doctor?
    type.eql? 'Doctor'
  end

  def patient?
    type.eql? 'Patient'
  end
end
