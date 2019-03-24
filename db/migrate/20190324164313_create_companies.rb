class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :locations
      t.string :industries
      t.string :twitter
      t.string :muse_id
      t.string :size

      t.timestamps
    end
  end
end
