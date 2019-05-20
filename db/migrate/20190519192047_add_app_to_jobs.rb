class AddAppToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :app, foreign_key: true
  end
end
