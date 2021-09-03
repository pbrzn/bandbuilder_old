class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :password, :type, :account, presence: true
  validates :name, uniqueness: true
end
