require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject(:user) { FactoryBot.build(:user) }

  describe '#create' do
    it 'redirects after sign up' do
      expect(response).to redirect_to(users_url)
    end
  end
end
