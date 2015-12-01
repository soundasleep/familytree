class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :key,   null: false
      t.string :value, null: false
      t.string :notes, null: true
      t.references :source, null: false, index: true, foreign_key: true
      t.references :person, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :facts, :key
    add_index :facts, :value
  end
end
