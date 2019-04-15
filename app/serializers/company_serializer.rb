class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :size, :locations, :industries, :twitter, :muse_id
end
