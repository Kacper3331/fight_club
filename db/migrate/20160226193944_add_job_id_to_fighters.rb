class AddJobIdToFighters < ActiveRecord::Migration
  def change
    add_column :fighters, :job_id, :integer
  end
end
