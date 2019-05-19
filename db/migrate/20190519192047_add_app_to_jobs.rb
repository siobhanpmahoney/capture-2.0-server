class AddAppToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :app, foreign_key: true, null:true
  end
end
