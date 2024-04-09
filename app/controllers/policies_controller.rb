class PoliciesController < ApplicationController
  before_action :set_policy, only: %i[ show ]

  # GET /policies/1
  def show
    render json: @policy, status: :ok
  end

  private

    def set_policy
      @policy = Policy.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end

    def policy_params
      params.fetch(:policy, {})
    end
end
