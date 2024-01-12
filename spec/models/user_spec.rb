require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should allow_value('user@example.com').for(:email) }
    it { should allow_value('USER@EXAMPLE.COM').for(:email) }
    it { should_not allow_value('userexample.com').for(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:bookmarks) }
    it { should have_many(:books).through(:bookmarks) }
  end

  describe 'authentication' do
    it { should respond_to(:authenticate) }
  end

  describe 'full_name' do
    it 'should return the full name of the user' do
      user = FactoryBot.create(:user, first_name: 'Mario', last_name: 'Paju')
      expect(user.full_name).to eq('Mario Paju')
    end
  end
end
