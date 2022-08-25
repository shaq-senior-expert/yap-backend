class Business < ApplicationRecord
  default_scope { order created_at: :desc }
  validates_presence_of :name, :description, :address
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
end
