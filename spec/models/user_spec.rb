require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should allow_value('user@example.com').for(:email) }
    it { should allow_value('USER@EXAMPLE.COM').for(:email) }
    it { should_not allow_value('userexample.com').for(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'associations' do
    it { should have_many(:bookmarks) }
    it { should have_many(:books).through(:bookmarks) }
  end
end
