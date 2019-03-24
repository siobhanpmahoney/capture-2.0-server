class Interview < ApplicationRecord
  belongs_to :app

  has_many :interview_contacts
  has_many :contacts, through: :interview_contacts
end
