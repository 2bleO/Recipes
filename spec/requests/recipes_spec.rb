require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'TestUser', email: 'Test@user1.com', password: 'password') }

  describe 'GET /index' do
    before do
      sign_in user
      get user_recipes_path(user.id)
    end

    it 'returns http ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Create a new Recipe')
    end
  end
end
