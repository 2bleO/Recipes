require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'TestUser2', email: 'Test@user2.com', password: 'password') }
  describe 'GET /index' do
    before do
      sign_in user
      get user_foods_path(user.id)
    end

    it 'returns http ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Measurement unit')
    end
  end
end
