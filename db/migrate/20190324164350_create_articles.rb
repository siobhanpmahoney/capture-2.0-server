class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :link
      t.string :title
      t.datetime :publication_date

      t.timestamps
    end
  end
end
