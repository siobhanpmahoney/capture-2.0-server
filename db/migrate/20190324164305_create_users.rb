class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :pref_locations
      t.string :pref_industries
      t.string :pref_categories
      t.string :pref_levels

      t.timestamps
    end
  end
end
