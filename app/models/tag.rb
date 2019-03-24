class Tag < ApplicationRecord
  belongs_to :app
  belongs_to :company
  belongs_to :user


  has_many :tag_articles
  has_many :articles, through: :tag_articles

  has_many :tag_notes
  has_many :notes, through: :tag_notes

  validates_uniqueness_of :name
end
