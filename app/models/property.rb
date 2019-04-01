class Property < ApplicationRecord
  acts_as_mappable

  validates :city, :zip_code, presence: true


  def as_json
    {
      type:         property_type,
      house_number: house_number,
      street:       street,
      city:         city,
      zip_code:     zip_code,
      lat:          lat,
      lng:          lng,
      price:        price
    }
  end
end
