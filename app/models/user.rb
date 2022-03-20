class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :posts, dependent: :destroy


  validates_presence_of :first_name, :last_name, :city, :country

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_address
    "#{number} #{street}, #{postcode} #{city}, #{country}"
  end
end
