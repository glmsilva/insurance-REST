class PolicyCreateWorker
   include Sneakers::Worker
   from_queue 'policy-create'
   def work(payload)
     logger.info "### READING PAYLOAD ###"
     payload = JSON.parse(payload)
     logger.info "### CREATING POLICY ###"
     logger.info payload
     ack!
   end
end
