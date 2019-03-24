class Job < ApplicationRecord
  belongs_to :company

  validates_uniqueness_of :muse_id
end
