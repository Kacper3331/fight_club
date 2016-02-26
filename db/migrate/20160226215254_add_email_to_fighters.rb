class AddEmailToFighters < ActiveRecord::Migration
  def change
    add_column :fighters, :email, :string
  end
end
