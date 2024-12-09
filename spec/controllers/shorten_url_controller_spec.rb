require 'rails_helper'

RSpec.describe "ShortenUrls", type: :request do

    let(:user) { FactoryBot.create(:user) }
    let(:shorten_url) { FactoryBot.create(:shorten_url) }
    let(:shorten_url1) { FactoryBot.create(:shorten_url) }

    before do
      secret_key = Rails.application.secret_key_base
      @token = JWT.encode({user_id: user.id}, secret_key)
      headers = { 'Authorization' => "Bearer #{@token}" }
    end

    it 'should return all urls' do
      shorten_url
      shorten_url1
      get '/shorten_urls'
      resonse = JSON.parse(response.body).count
      expect(response).to have_http_status(:success)
      expect(resonse).to eq(2)
    end

end
