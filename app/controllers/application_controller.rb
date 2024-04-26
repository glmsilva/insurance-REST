class ApplicationController < ActionController::API
  before_action :authenticate_token!

  def authenticate_token!
    token = request.headers['authorization'].split(" ").last
    if JWT.decode(token, 'banana', 'HS256')
      # TODO: fazer o check do usuário que está acessando
      # se existir é autorizado, senão é recusado

      @user = token
    else
      render json: { erro: "usuário não autorizado" }, status: 401
    end
  rescue JWT::DecodeError => e
    Rails.logger.info e
    render json: { erro: "token inválido" }, status: 400
  end
end
