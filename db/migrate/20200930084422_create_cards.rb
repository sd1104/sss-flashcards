class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :word, null: false
      t.text :explanation
      t.references :genre, null: false, foreign_key: true
      t.timestamps
    end
  end
end
