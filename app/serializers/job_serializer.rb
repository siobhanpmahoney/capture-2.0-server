class JobSerializer < ActiveModel::Serializer
  attributes :id, :name, :publication_date, :muse_id, :locations, :categories, :levels, :landing_page, :contents, :company

  belongs_to :company
end
