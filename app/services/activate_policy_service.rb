class ActivatePolicyService
  def initialize(payload)
    @payload = payload
    @policy = set_policy
  end

  def execute
    @policy.active!
  end

  private

  def set_policy
    policy_id = @payload.dig(:metadata, :policy_id)
    Policy.find(policy_id)
  end
end
