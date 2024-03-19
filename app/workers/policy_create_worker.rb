class PolicyCreateWorker
  include Sneakers::Worker
  from_queue 'policy-create'
  def work(payload)
    logger.info "### READING PAYLOAD ###"
    payload = JSON.parse(payload)
    logger.info "### CREATING POLICY ###"
    ActiveRecord::Base.transaction do
      insured_person = InsuredPerson.create!(name: payload["insured_person"]["name"],
                                            cpf: payload["insured_person"]["cpf"]
      )

      vehicle = Vehicle.create!(brand: payload["vehicle"]["brand"],
                               model: payload["vehicle"]["model"],
                               year: payload["vehicle"]["year"],
                               license_plate: payload["vehicle"]["license_plate"]
      )

      Policy.create!(effective_date: payload["effective_date"],
                    expiration_date: payload["expiration_date"],
                    vehicle_id: vehicle.id,
                    insured_person_id: insured_person.id
      )
    end
    logger.info payload
    ack!
  end
end
