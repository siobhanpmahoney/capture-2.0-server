class Job < ApplicationRecord
  belongs_to :company
  belongs_to :app, optional: true
  # has_one :user, through: :app

  validates :muse_id, uniqueness: true
end
