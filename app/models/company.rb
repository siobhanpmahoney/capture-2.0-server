class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  has_many :user_companies, dependent: :destroy
  has_many :users, through: :user_companies

  validates :muse_id, uniqueness: true
end
