class Company < ApplicationRecord
  has_many :jobs
  validates_uniqueness_of :muse_id
end
