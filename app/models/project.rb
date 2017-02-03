class Project < ApplicationRecord
  has_many :assigns
  has_many :developers , through: :assigns , dependent: :destroy


  # validates :name, presence: true, uniqueness: true
  # validates :description, presence: true
end
