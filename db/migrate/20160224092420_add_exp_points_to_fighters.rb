class AddExpPointsToFighters < ActiveRecord::Migration
  def change
    add_column :fighters, :exp_points, :integer, default: 100
  end
end
