class TagArticle < ApplicationRecord
  belongs_to :tag_id
  belongs_to :article
end
