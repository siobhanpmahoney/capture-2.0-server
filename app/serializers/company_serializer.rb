class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :size, :locations, :industries, :twitter, :muse_id, :image, :logo_image, :muse_landing_page

end
