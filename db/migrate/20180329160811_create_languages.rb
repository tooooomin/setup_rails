class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :code, null: false

      t.timestamps
    end
    add_index :languages, :code, unique: true
  end
end
