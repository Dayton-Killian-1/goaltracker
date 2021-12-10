class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.text :description
      t.integer :target_number
      t.integer :completed
      t.datetime :due_date
      t.integer :public

      t.timestamps
    end
  end
end
