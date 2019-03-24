class Job < ApplicationRecord
  belongs_to :company

  validates :muse_id, uniqueness: true
end
