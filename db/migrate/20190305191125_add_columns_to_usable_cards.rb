class AddColumnsToUsableCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :usable_cards, :type, :card_type
    add_column :usable_cards, :cooldown, :integer
    add_column :usable_cards, :cost, :integer
    add_column :usable_cards, :squad_size, :integer
    add_column :usable_cards, :health, :integer
    add_column :usable_cards, :armor, :integer
    add_column :usable_cards, :range, :integer
    add_column :usable_cards, :damage, :integer
    add_column :usable_cards, :attack_speed, :integer
  end
end
