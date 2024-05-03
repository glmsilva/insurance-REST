require 'rails_helper'

describe 'Policy Create Service' do
  context 'when attributes are valid' do
    let(:payload) do
      {
        effective_date: "2024-04-01",
        expiration_date: "2025-05-01",
        vehicle:
          {
            brand: "Wolfsvagem",
            model: "Fuska",
            year: "1969",
            license_plate: "ABC1D23"
          },
        insured_person:
          {
            name: "Zlatan Ibrahimovic",
            cpf: "123.456.789-10"
          }
      }.to_json
    end

    let(:price) do
      Struct.new(:id)
    end

    let(:payment_link) do
      Struct.new(:url)
    end

    it 'is successfull' do
      Price = Struct.new(:id)
      PaymentLink = Struct.new(:url)
      price = Price.new('id_do_price')
      payment_link = PaymentLink.new('link_do_stripe.com')

      allow(Stripe::Price).to receive(:create).and_return(price)

      allow(Stripe::PaymentLink).to receive(:create).and_return(payment_link)

      service = PolicyCreateService.new(JSON.parse(payload))

      expect { service.execute! }.to change(Policy, :count).by(1)
      expect(Policy.all.last.payment_link).to include('stripe')
    end
  end

  context 'when attributes are not valid' do
    let(:payload) do
      {
        effective_date: "2024-04-01",
        expiration_date: "2025-05-01",
        insured_person:
          {
            name: "Zlatan Ibrahimovic",
            cpf: "123.456.789-10"
          }
      }.to_json
    end

    it 'does not create a policy' do
      service = PolicyCreateService.new(JSON.parse(payload))

      expect { service.execute! }.to_not change(Policy, :count)
    end
  end
end
