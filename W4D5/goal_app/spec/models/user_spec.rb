# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }
  describe 'user' do
    context 'db validations' do
      it {should validate_presence_of(:username)}
      it {should validate_presence_of(:password_digest)}
      it {should validate_presence_of(:session_token)}
      it {should validate_uniqueness_of(:username)}
      it {should validate_uniqueness_of(:session_token)}
      it {should validate_length_of(:password).is_at_least(6)}
      it {should allow_value(nil).for(:password)}
    end

    context 'association validations'

    context '#ensure_session_token' do
      it 'does not change session_token if already present' do
        original_token = user.session_token
        user.ensure_session_token
        expect(user.session_token).to eq(original_token)
      end
    end
  end
end
