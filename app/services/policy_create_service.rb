class PolicyCreateService
  def initialize(payload)
  @payload = payload.symbolize_keys
  end

  def execute!
    ActiveRecord::Base.transaction do
    Policy.create!(
        effective_date: @payload[:effective_date],
        expiration_date: @payload[:expiration_date],
        insured_person: {
          name: @payload.dig(:insured_person, "name"),
          cpf: @payload.dig(:insured_person, "cpf")
        },
        vehicle: {
          brand: @payload.dig(:vehicle, "brand"),
          model: @payload.dig(:vehicle, "model"),
          year: @payload.dig(:vehicle, "year"),
          license_plate: @payload.dig(:vehicle, "license_plate")
        }
      )
    end
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.info e.message
      e.record.errors
  end
end
