class CreateTagNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_notes do |t|
      t.belongs_to :tag, foreign_key: true
      t.belongs_to :note, foreign_key: true

      t.timestamps
    end
  end
end
