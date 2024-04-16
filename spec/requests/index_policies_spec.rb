require 'rails_helper'

describe 'Index Policies', type: :request do
  context 'when all policies requested' do
    it 'shows a list of policies' do
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

      policy2 = Policy.create!(
        effective_date: "28-03-2024",
        expiration_date: "29-03-2025",
        insured_person:{
          name: "Vinicius Junior",
          cpf: "123.456.789-10"
       },
        vehicle: {
          brand: "Fiat",
          model: "Uno",
          year: "2000",
          license_plate: "ABC1D23"
        }
      )

      get "/policies"

      expect(response).to have_http_status(200)
      expect(response.body).to include("Erling Haaland")
      expect(response.body).to include("Vinicius Junior")
    end
  end
end

