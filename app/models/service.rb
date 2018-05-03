class Service < ApplicationRecord
  # belongs_to :user

  geocoded_by :full_street_address
  after_validation :geocode

  has_one :user, as: :driver
  has_many :orders

  def full_street_address
    "#{distance}" # Can use address, city and state.
  end
end
