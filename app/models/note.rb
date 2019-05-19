class Note < ApplicationRecord
  belongs_to :user
  has_many :tag_notes, dependent: :destroy
  has_many :tags, through: :tag_notes

  validates_uniqueness_of :title
end
