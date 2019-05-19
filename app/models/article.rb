class Article < ApplicationRecord

  has_many :tag_articles, dependent: :destroy
  has_many :tags, through: :tag_articles

  validates_uniqueness_of :link
end
