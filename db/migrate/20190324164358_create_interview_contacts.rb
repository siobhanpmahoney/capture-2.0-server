class CreateInterviewContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :interview_contacts do |t|
      t.belongs_to :interview, foreign_key: true
      t.belongs_to :contact, foreign_key: true

      t.timestamps
    end
  end
end
