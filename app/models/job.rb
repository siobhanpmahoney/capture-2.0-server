class Job < ApplicationRecord
  belongs_to :company
  has_one :app
  # has_one :user, through: :app

  validates :muse_id, uniqueness: true
end
