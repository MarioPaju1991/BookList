class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookmarks
  has_many :books, through: :bookmarks

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, if: :password_required?
  validates :first_name, presence: true
  validates :last_name, presence: true

  def password_required?
    new_record? || password.present?
  end
end
