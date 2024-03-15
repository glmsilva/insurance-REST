class Vehicle < ApplicationRecord
  validates_presence_of :brand, :license_plate, :year, :model
end
