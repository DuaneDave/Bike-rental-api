class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :bikes, through: :reservations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
