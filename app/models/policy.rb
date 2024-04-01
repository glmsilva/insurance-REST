class Policy < ApplicationRecord
  validates :effective_date, :expiration_date, presence: true
  validates :insured_person, presence: true
  validates :vehicle, presence: true

  store_accessor :vehicle, :brand, :model, :year, :license_plate
  store_accessor :insured_person, :name, :cpf

  validates :name, :cpf, presence: true
  validates :brand, :model, :year, :license_plate, presence: true
end
