class PolicyPaymentSucceededWorker
  include Sneakers::Workers
  from_queue 'policy-payment.succeeded'

  def work(payload)
    logger.info "### READING PAYLOAD ###"

    payload = JSON.parse(payload, symbolize_names: true)

    logger.info "### Updating Policy ###"
    policy_updated = ActivatePolicyService.new(payload).execute

    if policy_updated.errors.any?
      logger.error policy_updated
    end

    logger.info "PAYLOAD: #{payload}"
  end
end
