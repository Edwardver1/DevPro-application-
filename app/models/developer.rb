class Developer < ApplicationRecord
  has_many :assigns
  has_many :projects , through: :assigns , dependent: :destroy

  validates :name,  presence: true, length: { maximum: 50 }
  validates :surname,  presence: true, length: { maximum: 50 }
end
