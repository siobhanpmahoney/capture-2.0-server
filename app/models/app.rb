class App < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :interviews

  validates_uniqueness_of :job
end
