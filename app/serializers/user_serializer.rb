class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :pref_levels, :pref_locations, :pref_categories, :pref_industries

  # def notes
  #   object.notes
  # end

  has_many :apps
  has_many :jobs
  has_many :companies
  has_many :articles
  has_many :notes
  has_many :tags


end
