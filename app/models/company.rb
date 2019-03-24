class Company < ApplicationRecord
  validates_uniqueness_of :muse_id
end
