class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :word
      t.string :explanation

      t.timestamps
    end
  end
end
