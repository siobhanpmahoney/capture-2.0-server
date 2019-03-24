class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.belongs_to :app, foreign_key: true
      t.string :type
      t.datetime :date
      t.text :thank_you_note

      t.timestamps
    end
  end
end
