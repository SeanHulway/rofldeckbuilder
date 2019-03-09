class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :legion
      t.string :tier
      t.string :type
      t.integer :stage

      t.timestamps
    end
  end
end
