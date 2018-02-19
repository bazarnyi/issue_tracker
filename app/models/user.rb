class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :issues, dependent: :destroy

  enum role: [:regular, :admin]
end
