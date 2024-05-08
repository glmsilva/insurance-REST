require 'rails_helper'

describe 'Activate Policy Service' do
  context 'when payment completed' do
    let(:policy) do
      Policy.create!(
        effective_date: "28-03-2024",
        expiration_date: "29-03-2025",
        insured_person:{
          name: "Cristiano Ronaldo",
          cpf: "123.456.789-10"
        }  ,
        vehicle: {
          brand: "Fiat",
          model: "Uno",
          year: "2000",
          license_plate: "ABC1D23"
        }
    )
    end

    let(:payload) do
      {
        id: "seti_1NG8Du2eZvKYlo2C9XMqbR0x",
        object: "checkout_session",
        customer: "banana",
        metadata: {
          insured_person_name: "Cristiano Ronaldo",
          policy_id: "#{policy.id}"
        }
    }.to_json
    end

    it 'updates a policy to active' do
      service = ActivatePolicyService.new(JSON.parse(payload, symbolize_names: true))

      service.execute

      expect(policy.reload.status).to eq("active")
    end
  end
end
