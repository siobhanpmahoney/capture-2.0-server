class User < ApplicationRecord
  has_secure_password

  has_many :apps
  has_many :jobs, through: :apps
  has_many :tags

  validates_uniqueness_of :username
end
