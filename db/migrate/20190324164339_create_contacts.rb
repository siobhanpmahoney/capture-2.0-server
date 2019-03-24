class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :email
      t.belongs_to :interview, foreign_key: true

      t.timestamps
    end
  end
end
