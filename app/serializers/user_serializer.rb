class UserSerializer < ActiveModel::Serializer

  attributes :id, :username

  # def notes
  #   object.notes
  # end

  has_many :apps
  has_many :articles
  has_many :notes
  has_many :tags

end
