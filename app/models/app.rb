class App < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :job, dependent: :destroy
  has_many :interviews

  validates_uniqueness_of :job_id, :scope => [:user_id]

end
