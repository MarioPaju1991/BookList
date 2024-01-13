class Book < ApplicationRecord
  include Hashid::Rails

  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :genre, presence: true
  validates :image_url, presence: true
end
