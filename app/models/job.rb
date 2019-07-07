class Job < ApplicationRecord
  belongs_to :company, dependent: :destroy
  has_one :app, dependent: :destroy
  # has_one :user, through: :app

  validates :muse_id, uniqueness: true
end
