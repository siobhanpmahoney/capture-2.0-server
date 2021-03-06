class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :link
      t.string :title
      t.datetime :publication_date
      t.string :type
      t.string :muse_id
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
