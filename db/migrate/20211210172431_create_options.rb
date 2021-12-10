class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :pubpri

      t.timestamps
    end
  end
end
