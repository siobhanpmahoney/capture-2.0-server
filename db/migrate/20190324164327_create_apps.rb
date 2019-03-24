class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :job, foreign_key: true
      t.datetime :date_saved
      t.datetime :date_applied
      t.text :cover_letter

      t.timestamps
    end
  end
end
