class Article < ApplicationRecord

  has_many :tag_articles
  has_many :articles, through: :tag_articles
  
  validates_uniqueness_of :link
end
