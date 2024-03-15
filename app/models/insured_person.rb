class InsuredPerson < ApplicationRecord
  validates :name, :cpf, presence: true
  validates :cpf, uniqueness: true

  has_many :policies
end
