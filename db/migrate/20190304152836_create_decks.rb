class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :legion1
      t.string :legion2
      t.string :tier
      t.text :description

      t.timestamps
    end
  end
end
