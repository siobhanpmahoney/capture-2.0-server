class AddMuseLandingPageToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :muse_landing_page, :string
  end
end
