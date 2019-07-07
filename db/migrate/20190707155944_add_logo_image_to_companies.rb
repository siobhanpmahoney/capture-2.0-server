class AddLogoImageToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :logo_image, :string
  end
end
