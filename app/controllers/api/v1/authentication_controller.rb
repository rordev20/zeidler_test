class Api::V1::AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST api/v1/auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { data: {token: token} , message: I18n.t('global.success'), status: 200}
    else
      render json: { error: 'unauthorized', message: I18n.t('global.failure'), status: 401}
    end
  end

  def user
    render json: { data: { user: @current_user }, message: I18n.t('global.success'), status: 200}
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
