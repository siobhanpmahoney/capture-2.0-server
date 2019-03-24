class App < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates_uniqueness_of :job
end
