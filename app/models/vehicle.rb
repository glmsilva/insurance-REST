class Vehicle < ApplicationRecord
  validates :brand, :license_plate, :year, :model, presence: true
  validates :license_plate, uniqueness: true
end
