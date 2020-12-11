class CreateRestarents < ActiveRecord::Migration[5.2]
  def change
    create_table :restarents do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :tablename
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
