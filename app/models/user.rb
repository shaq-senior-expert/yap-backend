class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :businesses, through: :reviews
  validates_uniqueness_of :email
  # has_secure_password
end
