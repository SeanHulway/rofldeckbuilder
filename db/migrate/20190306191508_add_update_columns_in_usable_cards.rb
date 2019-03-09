class AddUpdateColumnsInUsableCards < ActiveRecord::Migration[5.2]
  def change
    change_column :usable_cards, :armor, :string
    change_column :usable_cards, :attack_speed, :float
  end
end
