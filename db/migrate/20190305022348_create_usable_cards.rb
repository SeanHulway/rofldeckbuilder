class CreateUsableCards < ActiveRecord::Migration[5.2]
  def change
    create_table :usable_cards do |t|
      t.string :name
      t.string :legion
      t.string :tier
      t.string :type
      t.integer :stage

      t.timestamps
    end
  end
end
