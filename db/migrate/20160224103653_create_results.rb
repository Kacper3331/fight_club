class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :winner_id
      t.integer :loser_id
      t.integer :winner_skill_id
      t.integer :loser_skill_id
      t.integer :winner_attack
      t.integer :loser_attack

      t.timestamps null: false
    end
  end
end
