class Interview < ApplicationRecord
  belongs_to :app
  has_many :contacts, dependent: :destroy
end
