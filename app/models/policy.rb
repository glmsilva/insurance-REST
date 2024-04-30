class Policy < ApplicationRecord
  validates :effective_date, :expiration_date, :insured_person, :vehicle, presence: true
  validates :status, presence: true

  store_accessor :vehicle, :brand, :model, :year, :license_plate
  store_accessor :insured_person, :name, :cpf

  validates :name, :cpf, presence: true
  validates :brand, :model, :year, :license_plate, presence: true

  enum status: { pending: 0, active: 1, expired: 2, cancelled: 3 }
end
