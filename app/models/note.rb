class Note < ApplicationRecord

  has_many :tag_notes
  has_many :tags, through: :tag_notes

  validates_uniqueness_of :title
end
