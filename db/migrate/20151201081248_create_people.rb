class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.boolean :homepage, null: false, default: false

      t.timestamps null: false
    end
  end
end
