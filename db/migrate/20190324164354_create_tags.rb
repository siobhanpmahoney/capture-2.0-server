class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.belongs_to :app, foreign_key: true
      t.belongs_to :company, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
