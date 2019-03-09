class AddTwelveCardsToDeck < ActiveRecord::Migration[5.2]
  def change
    add_column :decks, :card_1, :string
    add_column :decks, :card_2, :string
    add_column :decks, :card_3, :string
    add_column :decks, :card_4, :string
    add_column :decks, :card_5, :string
    add_column :decks, :card_6, :string
    add_column :decks, :card_7, :string
    add_column :decks, :card_8, :string
    add_column :decks, :card_9, :string
    add_column :decks, :card_10, :string
    add_column :decks, :card_11, :string
    add_column :decks, :card_12, :string
  end
end
