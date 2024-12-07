class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token, only: [:create, :login]

  def create
    @user = User.new(user_params)
    if @user.save 
      token = jwt_encode(user_id: @user.id)
       render json: { token: token }, status: :created 
     else 
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login 
    user = User.find_by(email: params[:email]) 
    if user&.authenticate(params[:password]) 
      token = jwt_encode(user_id: user.id) 
      render json: { token: token }, status: :ok 
    else 
      render json: { error: 'Invalid email or password' }, status: :unauthorized 
    end 
  end

  private

    def jwt_encode(payload)
      secret_key = Rails.application.secret_key_base
      JWT.encode(payload, secret_key)
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
