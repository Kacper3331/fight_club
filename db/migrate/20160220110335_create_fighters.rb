class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.string :firstname
      t.string :lastname
      t.text :description, default: ''

      t.timestamps null: false
    end
  end
end
