class Service < ApplicationRecord
  resourcify
  mount_uploader :image, ServicesImageUploader

  scope(:vehicle, -> (vehicle) { where("LOWER(vehicle) like ?", "%#{vehicle.downcase}%")})
  scope(:service_id, -> (service_id) { where("LOWER(service_id) like ?", "%#{service_id.downcase}%")})
  scope(:cost, -> (cost) { where cost: cost })

  geocoded_by :full_street_address
  after_validation :geocode

  has_one :user, as: :driver
  has_many :orders

  def full_street_address
    "#{distance}" # Can use address, city and state.
  end

  def blank_stars
   5 - rating.to_i
  end

end
