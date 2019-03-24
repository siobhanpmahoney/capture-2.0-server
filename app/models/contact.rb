class Contact < ApplicationRecord
  belongs_to :company

  has_many :interview_contacts
  has_many :interviews, through: :interview_contacts
end
