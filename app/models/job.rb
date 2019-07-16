class Job < ApplicationRecord
  belongs_to :company, dependent: :destroy
  has_many :apps
  has_many :users, through: :apps
  # has_one :user, through: :app

  validates :muse_id, uniqueness: true
end
