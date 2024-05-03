require 'rails_helper'

describe Policy, type: :model do
  subject {
    described_class.new(
      effective_date: "2024-04-01",
      expiration_date: "2025-05-01",
      insured_person: { name: "Erling Haaland", cpf: "123.456.789-10"},
      vehicle: {
        brand: "Wolfsvagem",
        model: "Fuska",
        year: "1969",
        license_plate: "ABC1D23"
      }
    )
  }

  before do
    Price = Struct.new(:id)
    PaymentLink = Struct.new(:url)
    price = Price.new('id_do_price')
    payment_link = PaymentLink.new('link_do_stripe.com')
    allow(Stripe::Price).to receive(:create).with(
      {
        currency: 'brl',
        product_data: {
          name: 'Seguro Auto Relabs'
        },
        unit_amount: 9999
      }
    ).and_return(price)

    allow(Stripe::PaymentLink).to receive(:create).with(
      {
        line_items: [{
        price: price.id,
        quantity: 1
        }]
      }
    ).and_return(payment_link)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it { should validate_presence_of(:effective_date) }
  it { should validate_presence_of(:expiration_date) }
  it { should validate_presence_of(:insured_person) }
  it { should validate_presence_of(:vehicle) }
  it { should validate_presence_of(:status) }
end
