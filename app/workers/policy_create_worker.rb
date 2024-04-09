class PolicyCreateWorker
  include Sneakers::Worker
  from_queue 'policy-create'

  def work_with_params(payload, metadata, handler)
    logger.info "### READING PAYLOAD ###"
    payload = JSON.parse(payload)
    logger.info "### CREATING POLICY ###"

    policy_created = PolicyCreateService.new(payload).execute!

    reply_queue = handler[:reply_to]
    correlation_id = handler[:correlation_id]

    logger.info "### PUBLISHING EVENT ###"

    publish policy_created.to_json, :to_queue => reply_queue, :correlation_id => correlation_id

    logger.info "### EVENT PUBLISHED, correlation_id: #{correlation_id} ###"
    logger.info "### QUEUE: #{reply_queue} ###"

    if policy_created.errors.any?
      logger.error policy_created
    end

    logger.info "PAYLOAD: #{payload}"

    ack!
  end
end
