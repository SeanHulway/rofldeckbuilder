class AddDeckRefToUsableCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :usable_cards, :deck, foreign_key: true
  end
end
