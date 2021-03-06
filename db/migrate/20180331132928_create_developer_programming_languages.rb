class CreateDeveloperProgrammingLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_programming_languages do |t|
      t.references :developer, foreign_key: true
      t.references :programming_language, foreign_key: true, index: {name: 'prog_lang'}

      t.timestamps
    end

    add_index :developer_programming_languages, [:developer_id, :programming_language_id], unique: true, name: 'index_dev_prog_lang_on_dev_id_and_prog_lang_id'
  end
end
