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

    it 'is successfull' do
      service = PolicyCreateService.new(JSON.parse(payload))

      expect { service.execute! }.to change(Policy, :count).by(1)
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

