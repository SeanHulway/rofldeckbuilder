class AddUsableCardRefToAbilities < ActiveRecord::Migration[5.2]
  def change
    add_reference :abilities, :usable_card, foreign_key: true
  end
end
