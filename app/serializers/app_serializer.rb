class AppSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :job_id, :date_saved, :date_applied, :cover_letter

  has_one :job
  # has_many :interviews
end
