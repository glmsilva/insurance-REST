class Policy < ApplicationRecord
  after_create :create_payment_link

  validates :effective_date, :expiration_date, :insured_person, :vehicle, presence: true
  validates :status, presence: true

  store_accessor :vehicle, :brand, :model, :year, :license_plate
  store_accessor :insured_person, :name, :cpf

  validates :name, :cpf, presence: true
  validates :brand, :model, :year, :license_plate, presence: true

  enum status: { pending: 0, active: 1, expired: 2, cancelled: 3 }

  def create_payment_link
    price = Stripe::Price.create({
      currency: 'brl',
      product_data: {
        name: "Seguro Auto Relabs - Apólice #{id}"
      },
      unit_amount: 9999
    })

    payment_link = Stripe::PaymentLink.create({
      line_items: [{
        price: price.id,
        quantity: 1,
      }],
      metadata: {
        policy_id: id,
        insured_person_name: insured_person["name"]
      }
    })

    self.update_column(:payment_link, payment_link.url)
  end
end
