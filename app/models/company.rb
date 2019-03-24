class Company < ApplicationRecord
  has_many :jobs
  validates :muse_id, uniqueness: true
end
