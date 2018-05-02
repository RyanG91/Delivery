class Service < ApplicationRecord
  # belongs_to :user
  has_one :user, as: :driver
  has_many :orders
end
