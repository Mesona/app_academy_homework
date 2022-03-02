require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User"
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:password) }
  it { should validate_presence_of(:password_digest)}
  describe "#is_password?" do
    it "returns true if passwords match" do
      user = User.new(email: 'abc123', password: 'password')
      expect(response).to be(true)
      user.is_password?('password')
    end
    it "returns false if passwords do not match" do
      user = User.new(email: 'abc123', password: 'password')
      expect(response).to be(false)
      user.is_password?('password1234')
    end
  end
end
