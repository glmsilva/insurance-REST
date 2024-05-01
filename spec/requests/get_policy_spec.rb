require 'rails_helper'

describe "Get Policy", type: :request do
  context "when policy is found" do
    it "responds with success" do
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

      policy = Policy.create!(
        effective_date: "28-03-2024",
        expiration_date: "29-03-2025",
        insured_person:{
          name: "Erling Haaland",
          cpf: "123.456.789-10"
       },
        vehicle: {
          brand: "Fiat",
          model: "Uno",
          year: "2000",
          license_plate: "ABC1D23"
        }
      )
      spec_token = JWT.encode({}, ENV['JWT_SECRET'], 'HS256')

      get "/policies/#{policy.id}", headers: { 'AUTHORIZATION' => spec_token }

      expect(response).to have_http_status(200)
    end
  end
end
