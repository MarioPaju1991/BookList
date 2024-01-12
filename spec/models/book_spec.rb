require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:publisher) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:image_url) }
  end

  describe 'associations' do
    it { should have_many(:bookmarks) }
    it { should have_many(:users).through(:bookmarks) }
  end
end
