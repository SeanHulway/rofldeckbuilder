class AddRemoveTwelveCardsToDeck < ActiveRecord::Migration[5.2]
  def change
    remove_column :decks, :card_1, :string
    remove_column :decks, :card_2, :string
    remove_column :decks, :card_3, :string
    remove_column :decks, :card_4, :string
    remove_column :decks, :card_5, :string
    remove_column :decks, :card_6, :string
    remove_column :decks, :card_7, :string
    remove_column :decks, :card_8, :string
    remove_column :decks, :card_9, :string
    remove_column :decks, :card_10, :string
    remove_column :decks, :card_11, :string
    remove_column :decks, :card_12, :string
  end
end
