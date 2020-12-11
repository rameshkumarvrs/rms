class CreateTableNames < ActiveRecord::Migration[5.2]
  def change
    create_table :table_names do |t|
      t.string :name
      t.integer :min_count
      t.integer :max_count
      t.references :restarent, foreign_key: true

      t.timestamps
    end
  end
end
