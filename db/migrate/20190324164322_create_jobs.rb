class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.text :contents
      t.string :name
      t.datetime :publication_date
      t.string :muse_id
      t.string :locations
      t.string :categories
      t.string :levels
      t.string :landing_page
      t.belongs_to :app, foreign_key: true
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
