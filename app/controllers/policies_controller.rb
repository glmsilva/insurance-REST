class PoliciesController < ApplicationController
  before_action :set_policy, only: %i[ show ]

  # GET /policies/1
  def show
    render json: @policy.to_json
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policy
      #@policy = Policy.find(params[:id])
      @policy = {id: 1}
    end

    # Only allow a list of trusted parameters through.
    def policy_params
      params.fetch(:policy, {})
    end
end
