class Property < ApplicationRecord

  validates :city, :zip_code, presence: true
end
