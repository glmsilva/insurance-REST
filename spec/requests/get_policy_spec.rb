require 'rails_helper'

describe "Get Policy", type: :request do
  context "when policy is found" do
    it "responds with success" do
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
      get "/policies/#{policy.id}"

      expect(response).to have_http_status(200)
    end
  end
end
