class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy
  validates :muse_id, uniqueness: true
end
