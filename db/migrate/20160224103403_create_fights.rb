class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :first_fighter_id
      t.integer :second_fighter_id
      t.integer :result_id

      t.timestamps null: false
    end
  end
end
