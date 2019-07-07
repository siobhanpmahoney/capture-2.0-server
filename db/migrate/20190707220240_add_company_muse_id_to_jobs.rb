class AddCompanyMuseIdToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :company_muse_id, :string
    add_column :jobs, :company_name, :string
  end
end
