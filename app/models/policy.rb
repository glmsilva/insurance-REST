class Policy < ApplicationRecord
  has_one :insured_person
  has_one :vehicle
end
