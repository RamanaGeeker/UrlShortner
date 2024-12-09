require 'rails_helper'

RSpec.describe "User", type: :request do

    let(:user) { FactoryBot.create(:user) }

    before do
      secret_key = Rails.application.secret_key_base
      @token = JWT.encode({user_id: user.id}, secret_key)
      headers = { 'Authorization' => "Bearer #{@token}" }
    end

    it 'should create user' do
      post '/users', params: {user: {name:"test_name", email: "test@test.com", password:"password", password_confirmation:"password"} }
      expect(response).to have_http_status(:success)
      expect(response.body).to include("token")
    end

end
