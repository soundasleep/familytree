class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :url, null: true
      t.integer :authority, null: false
      t.string :description, null: true
      t.string :key, null: false

      t.timestamps null: false
    end

    add_index :sources, :authority
    add_index :sources, :key
  end
end
